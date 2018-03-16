class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :illnesses
  has_many :immunizations
  has_many :prescriptions
  has_many :allergies
  
  accepts_nested_attributes_for :illnesses, :immunizations, :allergies, :prescriptions
  
end