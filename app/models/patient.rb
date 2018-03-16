class Patient < User
	has_one :health_profile
	has_many :doctors
	has_many :appointments
	has_many :allergies
	has_many :illnesses
	has_many :immunizations
	has_many :prescriptions
  
  scope :search, ->(search) { where("first_name ILIKE :search OR last_name ILIKE :search OR admission_id ILIKE :search ", search: "#{search}")}

  
end

