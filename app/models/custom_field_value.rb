class CustomFieldValue < ActiveRecord::Base
  # audited associated_with: :company
  belongs_to :custom_field
end
