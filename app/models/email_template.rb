class EmailTemplate < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :email_activities
  has_and_belongs_to_many :subscriber_groups
  audited associated_with: :company
  # validations
  validates :title, presence: true
  validates :subject, presence: true
  validates :sender_address, presence: true

  def subject_variables
    subject_variables = self.subject.split(/-(@[._a-zA-Z\d]*)-/)
    subject_variables.select! { |var| var if var[0] == '@' }.compact
    subject_variables.map { |var| var.split('@')[1] }
  end

  def body_variables
    body = self.body
    # body_variables = body.split(/&lt;(@[._a-zA-Z\d]*)&gt;/)
    # body_variables += body.split(/%3C(@[._a-zA-Z\d]*)%3E/)
    body_variables = body.split(/-(@[._a-zA-Z\d]*)-/)
    body_variables.select! { |var| var if var[0] == '@' }.compact
    body_variables.map { |var| var.split('@')[1] }
  end

  def stats(email_activities)
    total_processed = email_activities.count.to_f
    open_count = email_activities.where(status: %w[open click unsubscribe spam_complaint]).count
    delivery_count = open_count + email_activities.where(status: 'delivered').count
    bounce_count = email_activities.where(status: 'bounce').count
    clicked_count = email_activities.where(status: 'click').count
    if delivery_count > 0
      # @stats = {total_processed: total_processed, open_count: ((open_count/total_processed)), delivery_count: ((delivery_count/total_processed)), clicked_count: ((clicked_count/total_processed)), bounce_count: ((bounce_count/total_processed))}
      detailed_stats = {total_processed: total_processed, open_count: open_count, open_percent: (open_count/delivery_count), delivery_count: delivery_count, delivery_percent: ((delivery_count/delivery_count)), clicked_count: clicked_count, clicked_percent: ((clicked_count/delivery_count)), bounce_count: bounce_count, bounce_percent: ((bounce_count/delivery_count))}
    else
      detailed_stats = {total_processed: total_processed, open_count: 0, open_percent: 0, delivery_count: 0, delivery_percent: 0, clicked_count: 0, clicked_percent: 0, bounce_count: 0, bounce_percent: 0}
    end
    detailed_stats
  end

  # def self.send_emails
  #   require 'sendgrid-ruby'
  #   include SendGrid
  #
  #   from = Email.new(email: 'sudheerm16@gmail.com')
  #   subject = EmailTemplate.find(41).subject
  #   to = ['sudheerm16@gmail.com']
  #   content = Content.new(type: 'text/html', value: EmailTemplate.find(41).body.html_safe)
  #   mail = Mail.new(from, subject, to, content)
  #
  #   sg = SendGrid::API.new(api_key: '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')
  #   response = sg.client.mail._('send').post(request_body: mail.to_json)
  #   puts response.status_code
  #   puts response.body
  #   puts response.headers
  # end
end