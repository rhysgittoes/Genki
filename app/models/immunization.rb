class Immunization < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	belongs_to :appointment, optional: true
	belongs_to :health_profile, optional: true
	
	validates :name, presence: true
	
	before_save :set_date_to_today
	
	def set_date_to_today
		self.date = Date.today
	end
end
