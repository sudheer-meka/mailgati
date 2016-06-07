class EmailActivity < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :subscriber_group
  belongs_to :email_template
  has_many :campaign_logs
end
