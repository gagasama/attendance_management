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

ActiveRecord::Schema.define(:version => 20130325214628) do

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

  create_table "work_hours", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.time     "attendance"
    t.time     "leaving"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "work_hours", ["user_id"], :name => "index_work_hours_on_user_id"

end
