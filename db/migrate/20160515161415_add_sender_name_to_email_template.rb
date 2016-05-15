class AddSenderNameToEmailTemplate < ActiveRecord::Migration
  def change
    add_column :email_templates, :sender_name, :string
    add_column :companies, :sender_address, :string
    add_column :companies, :sender_name, :string
  end
end