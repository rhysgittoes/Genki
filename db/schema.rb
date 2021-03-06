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

ActiveRecord::Schema.define(version: 20180320034342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "severity"
    t.boolean "status"
    t.date "status_update"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.string "name"
    t.string "notes"
    t.bigint "health_profile_id"
    t.index ["appointment_id"], name: "index_allergies_on_appointment_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.text "symptoms", default: [], array: true
    t.text "diagnosis"
    t.string "referrals"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.string "key"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
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
    t.float "height"
    t.integer "bmi"
    t.string "insurer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
  end

  create_table "illnesses", force: :cascade do |t|
    t.boolean "status"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.string "name"
    t.string "notes"
    t.string "chronic", default: "false"
    t.bigint "health_profile_id"
    t.index ["appointment_id"], name: "index_illnesses_on_appointment_id"
  end

  create_table "immunizations", force: :cascade do |t|
    t.date "date"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.string "name"
    t.date "expiration_date"
    t.string "notes"
    t.bigint "health_profile_id"
    t.index ["appointment_id"], name: "index_immunizations_on_appointment_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "text"
    t.bigint "category"
    t.bigint "user_type"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "received", default: false
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
    t.bigint "patient_id"
    t.bigint "appointment_id"
    t.bigint "doctor_id"
    t.string "notes"
    t.bigint "health_profile_id"
    t.index ["appointment_id"], name: "index_prescriptions_on_appointment_id"
  end

  create_table "relations", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.index ["doctor_id"], name: "index_relations_on_doctor_id"
    t.index ["patient_id"], name: "index_relations_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.string "language"
    t.string "city"
    t.string "country"
    t.string "admission_id"
    t.string "certification"
    t.integer "experience"
    t.string "avatar"
    t.string "phone_number"
    t.string "address"
    t.string "secondary_address"
    t.string "zip_code"
    t.string "state"
    t.string "specialty"
    t.string "practice"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "allergies", "appointments"
  add_foreign_key "illnesses", "appointments"
  add_foreign_key "immunizations", "appointments"
  add_foreign_key "prescriptions", "appointments"
end
