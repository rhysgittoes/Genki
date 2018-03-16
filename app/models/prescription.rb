class Prescription < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	belongs_to :doctor, class_name: "Doctor", foreign_key: "doctor_id"
	belongs_to :appointment

	validates :medicine, presence: true
	validates :dosage, presence: true

	before_save :set_default_values
	
	def set_default_values
		self.refills = 0
	end

end