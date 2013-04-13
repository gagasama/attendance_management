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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130412133059) do

  create_table "attendance_management_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "attendance_management_users", ["email"], :name => "index_attendance_management_users_on_email", :unique => true
  add_index "attendance_management_users", ["reset_password_token"], :name => "index_attendance_management_users_on_reset_password_token", :unique => true

  create_table "attendance_times", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attendance_times", ["user_id"], :name => "index_attendance_times_on_user_id"

  create_table "leaving_times", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "leaving_times", ["user_id"], :name => "index_leaving_times_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",             :limit => 30, :default => "",    :null => false
    t.string   "hashed_password",   :limit => 40, :default => "",    :null => false
    t.string   "firstname",         :limit => 30, :default => "",    :null => false
    t.string   "lastname",          :limit => 30, :default => "",    :null => false
    t.string   "mail",              :limit => 60, :default => "",    :null => false
    t.boolean  "admin",                           :default => false, :null => false
    t.integer  "status",                          :default => 1,     :null => false
    t.datetime "last_login_on"
    t.string   "language",          :limit => 5,  :default => ""
    t.integer  "auth_source_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "type"
    t.string   "identity_url"
    t.string   "mail_notification",               :default => "",    :null => false
  end

  add_index "users", ["auth_source_id"], :name => "index_users_on_auth_source_id"
  add_index "users", ["id", "type"], :name => "index_users_on_id_and_type"

  create_table "vyw_user_extensions", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "password"
    t.string   "image_url"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "vyw_users_attendances", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "date",       :null => false
    t.datetime "in_time"
    t.datetime "out_time"
    t.datetime "updated_on"
  end

end
