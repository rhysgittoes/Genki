class User < ApplicationRecord
  include Clearance::User

  has_many :notifications

  def self.search(search)
    @patient = Patient.where("first_name ILIKE :search OR last_name ILIKE :search OR admission_id ILIKE :search ", search: "#{search}")
    @doctor = Doctor.where("first_name ILIKE :search OR last_name ILIKE :search OR admission_id ILIKE :search ", search: "#{search}") 
    @patient + @doctor
  end
  
end
