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
    mail(from: 'Salome<salome@quikchex.in>',subject: "#{subject}", to: email)
  end

  def error_notification(invalid_mailers)
    ActionMailer::Base.delivery_method = :smtp
    settings = {
        :address =>'smtp.mandrillapp.com', # intentionally
        :port => 587, # intentionally
        :domain => 'quikchex.in', #insetad of localhost.localdomain'
        :user_name => 'allanasd@quikchex.in',
        :password => '--------',
        :authentication => 'plain' # or smthing else
    }
    ActionMailer::Base.smtp_settings.merge!(settings)
    @invalid_mailers = invalid_mailers
    puts "invalid_mailers==>>>>#{@invalid_mailers.map{|mailer| mailer}}"
    mail(from: 'allan@quikchex.in',subject: 'Error Email',to: 'sudheer@quikchex.in')
  end

  def test_campaign(email,email_template)
    @body = email_template.body
    mail(from: 'Allan<allan@quikchex.in>',subject: "#{email_template.subject}",to: email)
  end
end
