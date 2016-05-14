class Company < ActiveRecord::Base
  has_many :users,dependent: :destroy
  has_many :custom_fields,dependent: :destroy
  has_many :subscriber_groups,dependent: :destroy
  has_many :email_templates,dependent: :destroy
  has_one :email_setting,dependent: :destroy
  audited
  has_associated_audits
end
