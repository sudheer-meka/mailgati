class Notification < ApplicationMailer
  def send_notification(file_name,email_template,subject_variables,body_variables,settings)
    require 'roo'
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings.merge!(settings)
    subject = email_template.subject
    @body = email_template.body
    spreadsheet = Roo::Spreadsheet.open("./uploads/#{file_name}")
    subject_variables.each do |variable|
      subject.gsub!("<#{variable}>", details[variable.split('@')[1].classify])
    end
    body_variables.each do |variable|
      @body.gsub!("&lt;#{variable}&gt;", details[variable.split('@')[1].classify])
      @body.gsub!("%3C#{variable}%3E", details[variable.split('@')[1].classify])
    end
    # mail(from: settings[:user_name],subject: "#{email_template.subject}", bcc: email)
  end
end
