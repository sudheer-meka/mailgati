class CustomField < ActiveRecord::Base
  belongs_to :company
  has_many :custom_field_values
end
