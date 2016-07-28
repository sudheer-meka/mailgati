class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :custom_fields, dependent: :destroy
  has_many :subscriber_groups, dependent: :destroy
  has_many :email_templates, dependent: :destroy
  has_one :email_setting, dependent: :destroy
  audited
  has_associated_audits

  def bounced_subscribers
    Subscriber.where(is_active: false, subscriber_group_id: subscriber_groups.map(&:id))
  end
end
