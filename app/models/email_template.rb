class EmailTemplate < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  # validations
  validates :title, presence: true
  validates :subject, presence: true

  def subject_variables
    subject_variables = self.subject.split(/<(@[._a-zA-Z\d]*)>/)
    subject_variables.select!{|var| var if var[0] == '@' }.compact
    subject_variables.map{|var| var.split('@')[1].classify}
  end

  def body_variables
    body = self.body
    body_variables = body.split(/&lt;(@[._a-zA-Z\d]*)&gt;/)
    body_variables += body.split(/%3C(@[._a-zA-Z\d]*)%3E/)
    body_variables += body.split(/<(@[._a-zA-Z\d]*)>/)
    body_variables.select!{|var| var if var[0] == '@' }.compact
  end

end
