class Allergy < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	belongs_to :appointment
	
	validates :name, presence: true
	validates :severity, presence: true
	
	enum status: [:dormant, :active]
	enum severity: [:mild, :moderate, :severe]
	
	before_save :set_default
	
	def set_default
		self.status = 1
	end

end