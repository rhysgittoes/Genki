class Patient < User
	has_one :health_profile
	has_many :doctors
	has_many :appointments
	has_many :allergies
	has_many :illnesses
	has_many :immunizations
	has_many :prescriptions
end

