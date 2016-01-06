class EmailGeneratorWorker

  include Sidekiq::Worker

  sidekiq_options :retry => false, :queue => "default"

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
          template = EmailTemplate.find(id)   
          subject = template.subject
          @body = template.body                
          subject_variables.each do |variable|      
            value = row[header_name_index_map[variable.split('@')[1].classify]]                         
            subject.gsub!("<#{variable}>", value)
          end
          body_variables.each do |variable|
            value = row[header_name_index_map[variable.split('@')[1].classify]]          
            @body.gsub!("&lt;#{variable}&gt;", value)
            @body.gsub!("%3C#{variable}%3E", value)
          end                  
          Notification.delay.send_notification(subject,@body,settings,row[header_name_index_map["Email"]])                    
        end
      end
    end
  
  end
end