class AddSenderAddressToEmailTemplate < ActiveRecord::Migration
  def change
    add_column :email_templates, :sender_address, :string
  end
end
