class Patient < User
	has_one :health_profiles
  has_many :illnesses
  has_many :appointments
  has_one :prescription

scope :search, ->(search) { where("first_name ILIKE :search OR last_name ILIKE :search OR admission_id ILIKE :search ", search: "#{search}")}

end

