class Notification < ApplicationMailer
  def send_notification(subject,body,settings,email)      
    ActionMailer::Base.delivery_method = :smtp
    settings = {
      :address => settings["address"], # intentionally
      :port => settings["port"], # intentionally
      :domain => settings["domain"], #insetad of localhost.localdomain'
      :user_name => settings["user_name"],
      :password => settings["password"],
      :authentication => settings["authentication"] # or smthing else
      }
    # Sidekiq.logger.warn "settings==#{settings}"
    ActionMailer::Base.smtp_settings.merge!(settings) 
    @body = body   
    mail(from: settings[:user_name],subject: "#{subject}", bcc: email)                        
  end
end
