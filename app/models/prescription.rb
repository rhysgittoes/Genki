class Prescription < ApplicationRecord
	belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
	belongs_to :doctor, class_name: "Doctor", foreign_key: "doctor_id", optional: true
	belongs_to :appointment, optional: true
	belongs_to :health_profile, optional: true
  
	validates :medicine, presence: true
	validates :dosage, presence: true
	
	  def initialize(attributes=nil)
	    attr_with_defaults = {:expiration_date => Date.today + 1.year, :refills => 0}.merge(attributes)
	    super(attr_with_defaults)
	 end
	
end