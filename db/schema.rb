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

ActiveRecord::Schema.define(version: 20151025194217) do

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
end
