# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# user = {}
# user['password'] = 'asdf'

# ActiveRecord::Base.transaction do
#   20.times do 
#     user['name'] = Faker::Name.name  
#     user['email'] = Faker::Internet.email
#     user['gender'] = rand(1..2)
#     user['phone'] = Faker::PhoneNumber.phone_number
#     user['country'] = Faker::Address.country
#     user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

#     User.create(user)
#   end
# end 


# create_table "users", force: :cascade do |t|
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "email", null: false
#     t.string "encrypted_password", limit: 128, null: false
#     t.string "confirmation_token", limit: 128
#     t.string "remember_token", limit: 128, null: false
#     t.string "type"
#     t.string "first_name"
#     t.string "last_name"
#     t.string "gender"
#     t.date "birthday"
#     t.string "language"
#     t.string "city"
#     t.string "country"
#     t.string "admission_id"
#     t.string "certification"
#     t.integer "experience"
#     t.index ["email"], name: "index_users_on_email"
#     t.index ["remember_token"], name: "index_users_on_remember_token"
#   end



require 'faker'



appointment = {}
ActiveRecord::Base.transaction do
  15.times do 
    appointment['date'] = Faker::Date.between(400.days.ago, Date.today)
    appointment['symptoms'] = Faker::Lorem.words(5)
    appointment['diagnosis'] = Faker::Lorem.paragraph(2, true, 8)
    appointment['referrals'] = Faker::Lorem.sentence(3, true, 4) 
    appointment['notes'] = Faker::Lorem.paragraph(3, true, 10)
    appointment['doctor_id'] = 1
    appointment['patient_id'] = 2
    Appointment.create(appointment)
  end
end


prescriptions = {}
ActiveRecord::Base.transaction do 
  15.times do 
    prescriptions['medicine'] = Faker::Lorem.word #=> "repellendus"
    prescriptions['dosage'] = Faker::Lorem.sentence(3) 
    prescriptions['refills'] = "none"
    prescriptions['expiration_date'] = Faker::Date.forward(14)
    prescriptions['patient_id'] = 2
    prescriptions['appointment_id'] = Faker::Number.between(0, 16)
    prescriptions['doctor_id'] = 1

    Prescription.create(prescriptions)
  end
end

# create_table "prescriptions", force: :cascade do |t|
#     t.string "medicine"
#     t.string "dosage"
#     t.string "refills"
#     t.date "expiration_date"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "patient_id"
#     t.bigint "appointment_id"
#     t.bigint "doctor_id"
#     t.index ["appointment_id"], name: "index_prescriptions_on_appointment_id"



