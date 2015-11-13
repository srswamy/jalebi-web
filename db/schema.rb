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

ActiveRecord::Schema.define(version: 20151113071304) do

  create_table "menu_items", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "menu_section_id", limit: 4
    t.integer  "price",           limit: 4
    t.integer  "unit_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "menu_items", ["menu_section_id"], name: "index_menu_items_on_menu_section_id", using: :btree
  add_index "menu_items", ["unit_id"], name: "index_menu_items_on_unit_id", using: :btree

  create_table "menu_sections", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "store_id",   limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "menu_sections", ["store_id"], name: "index_menu_sections_on_store_id", using: :btree

  create_table "order_customers", force: :cascade do |t|
    t.integer  "order_id",       limit: 4,     null: false
    t.string   "first_name",     limit: 255,   null: false
    t.string   "last_name",      limit: 255,   null: false
    t.integer  "phone_number",   limit: 4,     null: false
    t.text     "address_line_1", limit: 65535, null: false
    t.text     "address_line_2", limit: 65535
    t.string   "city",           limit: 255,   null: false
    t.string   "state",          limit: 255,   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "order_customers", ["order_id"], name: "index_order_customers_on_order_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "menu_item_id", limit: 4, null: false
    t.integer  "order_id",     limit: 4, null: false
    t.integer  "quantity",     limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "order_items", ["menu_item_id"], name: "index_order_items_on_menu_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "status",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                  precision: 10, scale: 2, null: false
    t.decimal  "tax",                       precision: 10, scale: 2
    t.decimal  "shipping",                  precision: 10, scale: 2
    t.decimal  "total",                     precision: 10, scale: 2, null: false
    t.integer  "order_status_id", limit: 4,                          null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "menu_items", "menu_sections"
  add_foreign_key "menu_items", "units"
  add_foreign_key "menu_sections", "stores"
  add_foreign_key "order_customers", "orders"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
