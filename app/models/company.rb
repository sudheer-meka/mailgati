class Company < ActiveRecord::Base
  has_many :users
  has_many :custom_fields
  has_many :subscriber_groups
  has_many :email_templates
  has_one :email_setting
end
