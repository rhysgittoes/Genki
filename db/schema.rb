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

ActiveRecord::Schema.define(version: 20180312041540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "type"
    t.string "severity"
    t.boolean "status"
    t.date "status_update"
    t.bigint "patient_id"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_allergies_on_appointment_id"
    t.index ["patient_id"], name: "index_allergies_on_patient_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.text "symtoms", default: [], array: true
    t.text "diagnosis"
    t.string "referrals"
    t.text "notes"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.string "language"
    t.string "city"
    t.string "country"
    t.integer "admission_id"
    t.string "certification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "experience"
  end

  create_table "health_profiles", force: :cascade do |t|
    t.string "blood_type"
    t.integer "weight"
    t.integer "height"
    t.integer "bmi"
    t.string "insurer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_health_profiles_on_patient_id"
  end

  create_table "illnesses", force: :cascade do |t|
    t.string "type"
    t.boolean "status"
    t.bigint "user_id"
    t.bigint "patient_id"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_illnesses_on_appointment_id"
    t.index ["patient_id"], name: "index_illnesses_on_patient_id"
    t.index ["user_id"], name: "index_illnesses_on_user_id"
  end

  create_table "immunizations", force: :cascade do |t|
    t.date "date"
    t.string "type"
    t.bigint "patient_id"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_immunizations_on_appointment_id"
    t.index ["patient_id"], name: "index_immunizations_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.string "language"
    t.string "email"
    t.string "city"
    t.string "country"
    t.string "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "medicine"
    t.string "dosage"
    t.string "refills"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allergies", "appointments"
  add_foreign_key "allergies", "patients"
  add_foreign_key "appointments", "doctors"
  add_foreign_key "health_profiles", "patients"
  add_foreign_key "illnesses", "appointments"
  add_foreign_key "illnesses", "patients"
  add_foreign_key "immunizations", "appointments"
  add_foreign_key "immunizations", "patients"
end
