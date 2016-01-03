class Notification < ApplicationMailer

  def send_notification(key, details, email_template,user)
    @user = user
    email_setting = @user.email_setting
    @settings = {
        :address => email_setting.address, # intentionally
        :port => email_setting.port, # intentionally
        :domain => email_setting.domain, #insetad of localhost.localdomain'
        :user_name => email_setting.username,
        :password => email_setting.password,
        :authentication => email_setting.authentication # or smthing else
    }
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings.merge!(@settings)
    subject = email_template.subject
    @body = email_template.body
    subject_variables = subject.split(/<(.*?)>/)
    subject_variables.select! { |var| var if var[0] == '@' }.compact
    subject_variables.each do |variable|
      subject.gsub!("<#{variable}>", details[variable.split('@')[1].classify])
    end
    body_variables = @body.split(/&lt;(.*?)&gt;/)
    body_variables += @body.split(/%3C(.*?)%3E/)
    body_variables.select! { |var| var if var[0] == '@' }.compact
    body_variables.each do |variable|
      @body.gsub!("&lt;#{variable}&gt;", details[variable.split('@')[1].classify])
      @body.gsub!("%3C#{variable}%3E", details[variable.split('@')[1].classify])
    end
    mail(from: email_setting.username,subject: "#{email_template.subject}", bcc: key)
  end

end
