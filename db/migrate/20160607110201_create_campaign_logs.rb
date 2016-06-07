class CreateCampaignLogs < ActiveRecord::Migration
  def change
    create_table :campaign_logs do |t|
      t.string :status
      t.string :url
      t.string :ip
      t.string :browser
      t.integer :email_activity_id

      t.timestamps null: false
    end
  end
end
