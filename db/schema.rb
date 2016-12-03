# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160607110201) do

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id",    limit: 4
    t.string   "auditable_type",  limit: 255
    t.integer  "associated_id",   limit: 4
    t.string   "associated_type", limit: 255
    t.integer  "user_id",         limit: 4
    t.string   "user_type",       limit: 255
    t.string   "username",        limit: 255
    t.string   "action",          limit: 255
    t.text     "audited_changes", limit: 65535
    t.integer  "version",         limit: 4,     default: 0
    t.string   "comment",         limit: 255
    t.string   "remote_address",  limit: 255
    t.string   "request_uuid",    limit: 255
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "campaign_logs", force: :cascade do |t|
    t.string   "status",            limit: 255
    t.string   "url",               limit: 255
    t.string   "ip",                limit: 255
    t.string   "browser",           limit: 255
    t.integer  "email_activity_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.boolean  "is_active",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_address", limit: 255
    t.string   "sender_name",    limit: 255
  end

  create_table "custom_field_values", force: :cascade do |t|
    t.integer  "custom_field_id", limit: 4
    t.integer  "subscriber_id",   limit: 4
    t.string   "value",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_field_values", ["custom_field_id"], name: "index_custom_field_values_on_custom_field_id", using: :btree
  add_index "custom_field_values", ["subscriber_id"], name: "index_custom_field_values_on_subscriber_id", using: :btree

  create_table "custom_fields", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.boolean  "is_active",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_fields", ["company_id"], name: "index_custom_fields_on_company_id", using: :btree

  create_table "email_activities", force: :cascade do |t|
    t.integer  "subscriber_group_id", limit: 4
    t.integer  "email_template_id",   limit: 4
    t.integer  "subscriber_id",       limit: 4
    t.string   "status",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "email_settings", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.string   "address",              limit: 255, default: "localhost"
    t.integer  "port",                 limit: 4,   default: 25
    t.string   "domain",               limit: 255
    t.string   "username",             limit: 255
    t.string   "password",             limit: 255
    t.string   "authentication",       limit: 255, default: "plain"
    t.boolean  "enable_starttls_auto",             default: true
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "company_id",           limit: 4
  end

  add_index "email_settings", ["user_id"], name: "index_email_settings_on_user_id", using: :btree

  create_table "email_templates", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "subject",        limit: 65535
    t.text     "body",           limit: 65535
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "user_id",        limit: 4
    t.integer  "company_id",     limit: 4
    t.string   "sender_address", limit: 255
    t.string   "status",         limit: 255,   default: "In Complete"
    t.string   "sender_name",    limit: 255
  end

  create_table "email_templates_subscriber_groups", id: false, force: :cascade do |t|
    t.integer "email_template_id",   limit: 4
    t.integer "subscriber_group_id", limit: 4
  end

  add_index "email_templates_subscriber_groups", ["email_template_id"], name: "index_email_templates_subscriber_groups_on_email_template_id", using: :btree
  add_index "email_templates_subscriber_groups", ["subscriber_group_id"], name: "index_email_templates_subscriber_groups_on_subscriber_group_id", using: :btree

  create_table "subscriber_groups", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "name",       limit: 255
    t.boolean  "is_active",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriber_groups", ["company_id"], name: "index_subscriber_groups_on_company_id", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.integer  "subscriber_group_id", limit: 4
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "contact",             limit: 255
    t.boolean  "is_active",                       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["subscriber_group_id"], name: "index_subscribers_on_subscriber_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "company_id",             limit: 4
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "contact",                limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
