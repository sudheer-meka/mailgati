class CreateEmailActivities < ActiveRecord::Migration
  def change
    create_table :email_activities do |t|
      t.integer :subscriber_group_id
      t.integer :email_template_id
      t.integer :subscriber_id
      t.string :status

      t.timestamps null: false
    end
  end
end
