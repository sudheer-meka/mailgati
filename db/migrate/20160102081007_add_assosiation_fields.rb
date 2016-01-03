class AddAssosiationFields < ActiveRecord::Migration
  def change
    add_column :email_templates,:user_id,:integer
    create_table :email_settings do |t|
      t.belongs_to :user, index: true
      t.string :address,default: 'localhost'
      t.integer :port,default: 25
      t.string :domain
      t.string :username
      t.string :password
      t.string :authentication,default: 'plain'
      t.boolean :enable_starttls_auto,default: true
      t.timestamps null: false
    end
  end
end
