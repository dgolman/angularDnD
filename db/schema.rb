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

ActiveRecord::Schema.define(version: 20140512164342) do

  create_table "line_item_options", force: true do |t|
    t.string   "line_item_id"
    t.string   "parent_id"
    t.string   "description"
    t.decimal  "price",        precision: 64, scale: 12, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.string   "order_ticket_id"
    t.string   "unique_id"
    t.string   "menu_section_id"
    t.string   "item_id"
    t.string   "name"
    t.decimal  "price",           precision: 64, scale: 12, default: 0.0
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_item_option_sections", force: true do |t|
    t.integer  "menu_item_id"
    t.string   "description"
    t.integer  "radiobuttons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_item_options", force: true do |t|
    t.integer  "menu_item_option_section_id"
    t.string   "description"
    t.decimal  "price",                       precision: 64, scale: 12, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.integer  "menu_section_id"
    t.string   "title"
    t.decimal  "price",           precision: 64, scale: 12, default: 0.0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_sections", force: true do |t|
    t.integer  "menu_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "restaurant_id"
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_tickets", force: true do |t|
    t.string   "menu_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "payment_type"
    t.decimal  "tip",          precision: 64, scale: 12, default: 0.0
    t.string   "order_type"
    t.decimal  "sub_total",    precision: 64, scale: 12, default: 0.0
    t.decimal  "total",        precision: 64, scale: 12, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.decimal  "revenue",      precision: 64, scale: 12, default: 0.0
    t.integer  "orders",                                 default: 0
    t.string   "subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
