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

ActiveRecord::Schema[7.0].define(version: 2024_07_27_083719) do
  create_table "dispense_records", force: :cascade do |t|
    t.integer "prescription_id", null: false
    t.datetime "dispense_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_dispense_records_on_prescription_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "dosage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "medicine_id", null: false
    t.string "dosage", null: false
    t.string "frequency", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicine_id"], name: "index_prescriptions_on_medicine_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  add_foreign_key "dispense_records", "prescriptions"
  add_foreign_key "prescriptions", "medicines"
  add_foreign_key "prescriptions", "users"
end
