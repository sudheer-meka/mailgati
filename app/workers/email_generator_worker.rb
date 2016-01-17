class EmailGeneratorWorker

  include Sidekiq::Worker

  sidekiq_options :retry => true, :queue => "default"

  def perform(file_name,id,subject_variables,body_variables,settings) 
    spreadsheet = Roo::Spreadsheet.open("public/uploads/#{file_name}")
    header_name_index_map = Hash.new('none')
    spreadsheet.each_with_pagename do |name, sheet|
      header = sheet.first
      header.each_with_index do |name,i|
        header_name_index_map[name] = i
      end
      sheet.each_with_index do |row, index|
        if index > 0
          email = row[header_name_index_map["Email"]]
          next if email.blank?
          next unless email =~ /^[a-zA-Z_.\d]+@[a-zA-Z_]+?\.[a-zA-Z.]*$/i
          template = EmailTemplate.find(id)
          subject = template.subject
          @body = template.body                
          subject_variables.each do |variable|      
            value = row[header_name_index_map[variable.split('@')[1].classify]]                         
            subject.gsub!("<#{variable}>", value)
          end
          puts "Email===>>>>>#{email}"
          body_variables.each do |variable|
            value = row[header_name_index_map[variable.split('@')[1].classify]]          
            # @body.gsub!("&lt;#{variable}&gt;", value)
            # @body.gsub!("%3C#{variable}%3E", value)
            @body.gsub!("<#{variable}>", value)
          end
          Notification.delay.send_notification(subject,@body,settings,email)
        end
        puts "Line No Is: #{index + 1}"
      end
    end
  end
end