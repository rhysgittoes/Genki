class Immunization < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	belongs_to :appointment
end
