class Illness < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	belongs_to :appointment
	
	before_save :set_default
	
	enum status: [:dormant, :active]

	validates :name, presence: true
	
	def set_default
		self.status = 1
	end
end