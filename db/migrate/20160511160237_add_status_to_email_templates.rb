class AddStatusToEmailTemplates < ActiveRecord::Migration
  def change
    add_column :email_templates, :status, :string,default: 'In Complete'
  end
end
