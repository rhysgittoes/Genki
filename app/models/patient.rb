class Patient < User
	has_one :health_profiles
  has_many :illnesses
  has_many :appointments
  has_one :prescription

end

