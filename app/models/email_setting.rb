class EmailSetting < ActiveRecord::Base
  audited associated_with: :company
  belongs_to :user
  belongs_to :company
end
