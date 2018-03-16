class Appointment < ApplicationRecord
	belongs_to :doctor
	belongs_to :patient
	has_many :illnesses
	has_many :immunizations
	has_many :prescriptions
	has_many :allergies
	accepts_nested_attributes_for :illnesses, :immunizations, :allergies, :prescriptions, reject_if: :all_blank, allow_destroy: true
	
	before_create :set_date_to_today, :set_key
	
	def set_date_to_today
		self.date = Date.today
	end
	
	def set_key
		self.key = SecureRandom.hex(4).upcase
	end
end