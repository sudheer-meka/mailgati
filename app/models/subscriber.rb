class Subscriber < ActiveRecord::Base
  has_many :custom_field_values
  belongs_to :subscriber_group
  # audited associated_with: :company
end
