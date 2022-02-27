# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_27_000305) do

  create_table "registrations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "time_slot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_slot_id"], name: "index_registrations_on_time_slot_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.string "name"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.integer "registrations_count", default: 0
    t.integer "capacity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "token"
    t.integer "registrations_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "registrations", "time_slots"
  add_foreign_key "registrations", "users"
end
