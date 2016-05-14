class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :email_templates
  has_one :email_setting
  belongs_to :company
  audited associated_with: :company

  validates_presence_of :email
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of :first_name, :last_name, :maximum => 40, :message => "cannot be more than 40 characters long"
end
