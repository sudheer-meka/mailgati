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

  def error_notification(invalid_mailers)
    ActionMailer::Base.delivery_method = :smtp
    settings = {
        :address =>'smtp.mandrillapp.com', # intentionally
        :port => 587, # intentionally
        :domain => 'quikchex.in', #insetad of localhost.localdomain'
        :user_name => 'allan@quikchex.in',
        :password => 'xpSqHiQt9A7qT9dyB4bGyA',
        :authentication => 'plain' # or smthing else
    }
    ActionMailer::Base.smtp_settings.merge!(settings)
    @invalid_mailers = invalid_mailers
    mail(from: 'allan@quikchex.in',subject: 'Error Email',bcc: 'sudheer@quikchex.in')
  end
end
