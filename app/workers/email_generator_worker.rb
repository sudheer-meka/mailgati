class EmailGeneratorWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false, :queue => "default"

  def perform(file_name, id, subject_variables, body_variables, settings)
    spreadsheet = Roo::Spreadsheet.open("public/uploads/#{file_name}")
    header_name_index_map = Hash.new('none')

    spreadsheet.each_with_pagename do |name, sheet|
      header = sheet.first
      header.each_with_index do |name, i|
        header_name_index_map[name] = i
      end
      @invalid_mailers = []
      sheet.each_with_index do |row, index|
        begin
          if index > 0
            email = row[header_name_index_map["Email"]]
            next if email.blank?
            # next unless email =~ /^[a-zA-Z_.\d]+@[a-zA-Z_]+?\.[a-zA-Z.]*$/i
            template = EmailTemplate.find(id)
            subject = template.subject
            @body = template.body
            subject_variables.each do |variable|
              value = row[header_name_index_map[variable.split('@')[1].classify]]
              subject.gsub!("<#{variable}>", value)

            end
            body_variables.each do |variable|
              value = row[header_name_index_map[variable.split('@')[1].classify]]
              @body.gsub!("<#{variable}>", value)
              @body.gsub!("&lt;#{variable}&gt;", value)
            end
            Notification.delay.send_notification(subject, @body, settings, email)
            puts "Email===>>>>>#{email}"
            puts "Line No Is: #{index + 1}=="
          end
        rescue Exception => invalid
          @invalid_mailers << "#{invalid.message} at line no #{index+1}"
          puts "#{invalid.message} at line no #{index+1}"
        end
      end
      Notification.delay.error_notification(@invalid_mailers) unless @invalid_mailers.blank?
    end
  end
end