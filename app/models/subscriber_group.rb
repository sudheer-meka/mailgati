class SubscriberGroup < ActiveRecord::Base
  belongs_to :company
  has_many :subscribers,dependent: :destroy
  has_many :email_activities,dependent: :destroy
  has_and_belongs_to_many :email_templates
  audited associated_with: :company

  def stats(email_activities)
    total_processed = email_activities.count.to_f
    open_count = email_activities.where(status: %w[open click unsubscribe spam_complaint]).count
    delivery_count = open_count + email_activities.where(status: 'delivered').count
    bounce_count = email_activities.where(status: 'bounce').count
    clicked_count = email_activities.where(status: 'click').count
    if delivery_count > 0
      # @stats = {total_processed: total_processed, open_count: ((open_count/total_processed)), delivery_count: ((delivery_count/total_processed)), clicked_count: ((clicked_count/total_processed)), bounce_count: ((bounce_count/total_processed))}
      detailed_stats = {total_processed: total_processed, open_count: open_count,open_percent: (open_count/delivery_count), delivery_count: delivery_count,delivery_percent: ((delivery_count/delivery_count)), clicked_count:clicked_count,clicked_percent:  ((clicked_count/delivery_count)), bounce_count:bounce_count,bounce_percent: ((bounce_count/delivery_count))}
    else
      detailed_stats = {total_processed: total_processed, open_count: 0,open_percent: 0, delivery_count: 0,delivery_percent: 0, clicked_count:0,clicked_percent:  0, bounce_count:0,bounce_percent: 0}
    end
    detailed_stats
  end
end
