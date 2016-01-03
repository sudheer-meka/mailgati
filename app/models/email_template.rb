class EmailTemplate < ActiveRecord::Base
  belongs_to :user

  # validations
  validates :title, presence: true
  validates :subject, presence: true
end
