class HealthProfile < ApplicationRecord
	belongs_to :patient
	has_many :illness
	has_many :allergies
	has_many :immunization
	has_many :prescriptions
end
