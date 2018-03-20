class HealthProfile < ApplicationRecord
  belongs_to :patient, class_name: "Patient", foreign_key: "patient_id"
  has_many :illnesses
  has_many :allergies
  has_many :immunizations
  has_many :prescriptions
	accepts_nested_attributes_for :illnesses, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :allergies, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :immunizations, :prescriptions, reject_if: :all_blank, allow_destroy: true
	

  # validates :blood_type, presence: true
  # validates :weight, presence: true, numericality: true
  # validates :height, presence: true, numericality: true

  def bmi
    self.weight.fdiv(height*2).to_s[0..4]
  end

  
end