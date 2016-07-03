class Subscriber < ActiveRecord::Base
  has_many :custom_field_values,dependent: :destroy
  has_many :email_activities
  belongs_to :subscriber_group

  # audited associated_with: :company
end