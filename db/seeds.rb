doctor_specialties = ["Allergy and immunology",
"Anesthesiology",
"Cardiology",
"Cardiovascular surgery",
"Clinical laboratorysciences",
"Dermatology",
"Dietetics",
"Emergency medicine",
"Endocrinology",
"Family medicine",
"Forensic medicine",
"Gastroenterology",
"General surgery",
"Geriatrics",
"Gynecology",
"Hepatology",
"Hospital medicine",
"Infectious disease",
"Intensive care medicine",
"Internal Medicine",
"Medical research",
"Nephrology",
"Neurology",
"Neurosurgery",
"Obstetrics and gynecology",
"Oncology",
"Ophthalmology",
"Oral and maxillofacial surgery",
"Orthopedic surgery",
"Otorhinolaryngology, or ENT",
"Palliative care",
"Pathology",
"Pediatrics",
"Pediatric surgery",
"Physical medicine and rehabilitation Or Physiatry",
"Plastic surgery",
"Podiatry",
"Proctology",
"Psychiatry",
"Pulmonology",
"Public Health",
"Radiology",
"Rheumatology",
"Surgical oncology",
"Thoracic surgery",
"Transplant surgery",
"Urgent Care Medicine",
"Urology",
"Vascular surgery"]


require 'faker'

doctor = {}
ActiveRecord::Base.transaction do
  500.times do
    doctor = Doctor.new
    doctor.email = Faker::Internet.email
    doctor.phone_number = Faker::PhoneNumber.phone_number
    doctor.first_name = Faker::Name.first_name
    doctor.last_name = Faker::Name.last_name
    doctor.gender = ['Female', 'Male'][rand(0..1)]
    doctor.birthday = Faker::Date.birthday(18, 65)
    doctor.language = "English"
    doctor.address = Faker::Address.street_address
    doctor.secondary_address = Faker::Address.secondary_address
    doctor.city = Faker::Address.city
    doctor.zip_code = Faker::Address.zip_code
    doctor.state = Faker::Address.state
    doctor.country = Faker::Address.country
    doctor.admission_id = SecureRandom.hex(4).upcase
    doctor.specialty = doctor_specialties[rand(0..doctor_specialties.length-1)]
    doctor.practice = Faker::Company.name
    doctor.password = 'password'
    doctor.save
  end
end

ActiveRecord::Base.transaction do
  10.times do
    patient = Patient.new
    patient.email = Faker::Internet.email
    patient.phone_number = Faker::PhoneNumber.phone_number
    patient.avatar = Faker::Avatar.image("profile-picture","60x60")
    patient.first_name = "Christina"
    patient.last_name = Faker::Name.last_name
    patient.gender = ['Female', 'Male'][rand(0..1)]
    patient.birthday = Faker::Date.birthday(18, 65)
    patient.language = "English"
    patient.address = Faker::Address.street_address
    patient.secondary_address = Faker::Address.secondary_address
    patient.city = "Kuala Lumpur"
    patient.zip_code = Faker::Address.zip_code
    patient.state = "Kuala Lumpur Federal Territory"
    patient.country = "Malaysia"
    patient.admission_id = SecureRandom.hex(4).upcase
    patient.password = 'password'
    patient.save
    
    health_profile = HealthProfile.new
    health_profile.blood_type = ["A+", "A-","B+","B-","AB+","AB-","O+","O-"][rand(0..7)]
    health_profile.height = rand(1.3..1.9)
    health_profile.insurer = ["BCBS","United Health Care","Amica","Affleck","BCBS Texas","OneChoice"][rand(0..5)]
    health_profile.weight = rand(16..24.9)*2*health_profile.height
    health_profile.patient_id = patient.id
    health_profile.save
  end
end



# appointment = {}
# ActiveRecord::Base.transaction do
#   15.times do 
#     appointment['date' = Faker::Date.between(400.days.ago, Date.today)
#     appointment['symptoms' = Faker::Lorem.words(5)
#     appointment['diagnosis' = Faker::Lorem.paragraph(2, true, 8)
#     appointment['referrals' = Faker::Lorem.sentence(3, true, 4) 
#     appointment['notes'] = Faker::Lorem.paragraph(3, true, 10)
#     appointment['doctor_id'] = Patient.find(rand(15)).id
#     appointment['patient_id'] = Doctor.find(rand(15)).id
#     Appointment.create(appointment)
#   end
# end


# prescriptions = {}
# ActiveRecord::Base.transaction do 
#   15.times do 
#     prescriptions['medicine'] = Faker::Lorem.word #=> "repellendus"
#     prescriptions['dosage'] = Faker::Lorem.sentence(3) 
#     prescriptions['refills'] = "none"
#     prescriptions['expiration_date'] = Faker::Date.forward(14)
#     prescriptions['patient_id'] = 2
#     prescriptions['appointment_id'] = Faker::Number.between(0, 16)
#     prescriptions['doctor_id'] = 1

#     Prescription.create(prescriptions)
#   end
# end
