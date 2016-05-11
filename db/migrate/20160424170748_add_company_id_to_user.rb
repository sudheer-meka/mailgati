class AddCompanyIdToUser < ActiveRecord::Migration
  def change
    add_column :users,:company_id,:integer
    add_column :email_templates,:company_id,:integer
    add_column :email_settings,:company_id,:integer
    create_table :companies do |t|
      t.string :name
      t.boolean :is_active,default: true
      t.timestamps
    end
    create_table :subscriber_groups do |t|
      t.belongs_to :company, index: true
      t.string :name
      t.boolean :is_active,default: true
      t.timestamps
    end
    create_table :custom_fields do |t|
      t.belongs_to :company, index: true
      t.string :name
      t.string :type
      t.boolean :is_active,default: true
      t.timestamps
    end

    create_table :subscribers do |t|
      t.belongs_to :subscriber_group, index: true
      t.string :name
      t.string :email
      t.string :contact
      t.boolean :is_active,default: true
      t.timestamps
    end
    create_table :custom_field_values do |t|
      t.belongs_to :custom_field, index: true
      t.belongs_to :subscriber, index: true
      t.string :value
      t.timestamps
    end
  end
end