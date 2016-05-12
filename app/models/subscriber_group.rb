class SubscriberGroup < ActiveRecord::Base
  belongs_to :company
  has_many :subscribers,dependent: :destroy
  has_and_belongs_to_many :email_templates
  audited associated_with: :company
end
