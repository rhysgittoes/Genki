class HealthProfile < ApplicationRecord
	belongs_to :patient
	has_many :illness
	has_many :allergies
	has_many :immunization
	has_many :prescriptions

	validates :blood_type, presence: true
	validates :weight, presence: true, numericality: true
	validates :height, presence: true, numericality: true

	def bmi
		self.weight.fdiv(height*2)
	end

	
end
