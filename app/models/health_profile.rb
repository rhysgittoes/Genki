class HealthProfile < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	has_many :illnesses
	has_many :allergies
	has_many :immunizations
	has_many :prescriptions

	# validates :blood_type, presence: true
	# validates :weight, presence: true, numericality: true
	# validates :height, presence: true, numericality: true

	def bmi
	 	self.weight.fdiv(height*2)
	end

	
end
