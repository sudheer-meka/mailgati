class Audit < ActiveRecord::Base
  belongs_to :user

  def company
    return Company.find(self.associated_id)
  end
end
