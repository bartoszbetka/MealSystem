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

ActiveRecord::Schema.define(version: 20170316143823) do

  create_table "meals", force: :cascade do |t|
    t.string   "name",       limit: 50,                         null: false
    t.decimal  "price",                 precision: 5, scale: 2, null: false
    t.integer  "order_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id"
  end

  add_index "meals", ["order_id"], name: "index_meals_on_order_id"
  add_index "meals", ["user_id"], name: "index_meals_on_user_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string "status", limit: 30
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_status_id"
    t.string   "restaurantName",  limit: 50,                         null: false
    t.decimal  "totalPrice",                 precision: 7, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "user_id"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
