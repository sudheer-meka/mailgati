class WebhookSyncWorker
  include Sidekiq::Worker
  # sidekiq_options :retry => false, :queue => "default"

  def perform(params)
    params['_json'].each do |event|
      next if event['email_template_id'].blank?
      begin
        email_activity = EmailActivity.find_or_create_by(subscriber_id: event['subscriber_id'].to_i,email_template_id: event['email_template_id'].to_i,subscriber_group_id: event['subscriber_group_id'].to_i)
        email_activity.campaign_logs.create(created_at: Time.at(event['timestamp']),status: event['event'],url: event['url'],ip: event['ip'])
        status = email_activity.campaign_logs.order('created_at desc').first.status
        email_activity.update_attribute(:status,status)
        email_activity.subscriber.update_attribute(:is_active,false) if status == 'bounce'
      rescue Exception => invalid
        next
      end
    end
  end
end
