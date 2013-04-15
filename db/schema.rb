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

ActiveRecord::Schema.define(:version => 20130211025726) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "poll_options", :force => true do |t|
    t.string   "color"
    t.text     "label"
    t.integer  "poll_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "poll_votes", :force => true do |t|
    t.integer  "poll_id"
    t.integer  "poll_option_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "poll_votes", ["poll_id", "user_id"], :name => "index_poll_votes_on_poll_id_and_user_id", :unique => true

  create_table "polls", :force => true do |t|
    t.text     "question"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
