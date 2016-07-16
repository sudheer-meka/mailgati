class Subscriber < ActiveRecord::Base
  has_many :custom_field_values,dependent: :destroy
  has_many :email_activities
  belongs_to :subscriber_group

  # audited associated_with: :company
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end