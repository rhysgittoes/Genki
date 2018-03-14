class Prescription < ApplicationRecord
	belongs_to :doctor, class_name: "Patient", foreign_key: "patient_id"

end