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

ActiveRecord::Schema.define(version: 20161206093157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargoes", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "number"
    t.integer  "capacity"
    t.integer  "weight"
    t.index ["name"], name: "index_cargoes_on_name", unique: true, using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cargo_id",   null: false
    t.integer  "route_id",   null: false
    t.integer  "truck_id",   null: false
    t.date     "begin_date", null: false
    t.time     "begin_time", null: false
    t.date     "end_date",   null: false
    t.time     "end_time",   null: false
  end

  create_table "destination_loads", force: :cascade do |t|
    t.integer  "capacity",         null: false
    t.integer  "current_quantity", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "destination_id"
    t.integer  "cargo_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.index ["name"], name: "index_destinations_on_name", unique: true, using: :btree
  end

  create_table "enterprises", force: :cascade do |t|
    t.integer  "destination_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.string   "mark"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.integer  "destination_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "cargo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raw_producers", force: :cascade do |t|
    t.integer  "destination_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "raws", force: :cascade do |t|
    t.integer  "capacity"
    t.integer  "cargo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "length",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "begin_id",   null: false
    t.integer  "end_id",     null: false
  end

  create_table "storages", force: :cascade do |t|
    t.integer  "destination_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "truck_for_productions", force: :cascade do |t|
    t.integer  "truck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "capacity"
    t.integer  "enterprise_id"
    t.integer  "storage_id"
  end

  create_table "truck_for_raws", force: :cascade do |t|
    t.integer  "capacity"
    t.integer  "truck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "enterprise_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "number",           null: false
    t.string   "mark",             null: false
    t.integer  "fuel_consumption", null: false
    t.integer  "capacity_fuel",    null: false
    t.integer  "average_speed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "fuel_id",          null: false
    t.index ["number"], name: "index_trucks_on_number", using: :btree
  end

  add_foreign_key "deliveries", "cargoes"
  add_foreign_key "deliveries", "routes"
  add_foreign_key "deliveries", "trucks"
  add_foreign_key "destination_loads", "cargoes"
  add_foreign_key "destination_loads", "destinations"
  add_foreign_key "enterprises", "destinations"
  add_foreign_key "markets", "destinations"
  add_foreign_key "productions", "cargoes"
  add_foreign_key "raw_producers", "destinations"
  add_foreign_key "raws", "cargoes"
  add_foreign_key "routes", "destinations", column: "begin_id"
  add_foreign_key "routes", "destinations", column: "end_id"
  add_foreign_key "storages", "destinations"
  add_foreign_key "truck_for_productions", "enterprises"
  add_foreign_key "truck_for_productions", "storages"
  add_foreign_key "truck_for_productions", "trucks"
  add_foreign_key "truck_for_raws", "enterprises"
  add_foreign_key "truck_for_raws", "trucks"
  add_foreign_key "trucks", "fuels"
end
