class SubscriberGroup < ActiveRecord::Base
  belongs_to :company
  has_many :subscribers,dependent: :destroy
end
