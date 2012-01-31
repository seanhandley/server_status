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

ActiveRecord::Schema.define(:version => 20120131190442) do

  create_table "events", :force => true do |t|
    t.string   "title",         :null => false
    t.text     "description",   :null => false
    t.date     "scheduled_for"
    t.integer  "status_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.date     "resolved_at"
  end

  create_table "statuses", :force => true do |t|
    t.string  "title",    :null => false
    t.integer "priority"
  end

  add_index "statuses", ["priority"], :name => "index_statuses_on_priority", :unique => true

  create_table "updates", :force => true do |t|
    t.string   "description", :null => false
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
