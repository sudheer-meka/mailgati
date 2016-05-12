class CreateEmailTemplatesAndSubscriberGroups < ActiveRecord::Migration
  def change
    create_table :email_templates_subscriber_groups, id: false do |t|
      t.belongs_to :email_template, index: true
      t.belongs_to :subscriber_group, index: true
    end
  end
end
