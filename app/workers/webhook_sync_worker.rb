class WebhookSyncWorker
  include Sidekiq::Worker
  # sidekiq_options :retry => false, :queue => "default"

  def perform(params)
    params['_json'].each do |event|
      next if event['email_template_id'].blank?
      email_activity = EmailActivity.find_or_create_by(subscriber_id: event['subscriber_id'].to_i,email_template_id: event['email_template_id'].to_i,subscriber_group_id: event['subscriber_group_id'].to_i)
      email_activity.campaign_logs.create(created_at: Time.at(event['timestamp']),status: event['event'],url: event['url'],ip: event['ip'],browser: event['useragent'])
      email_activity.update_attribute(:status,email_activity.campaign_logs.order('created_at desc').first.status)
    end
  end
end