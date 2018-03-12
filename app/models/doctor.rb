class Doctor < ApplicationRecord
  has_many :patients
  has_many :prescriptions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :language, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :admission_id, presence: true
  validates :certification, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :experience, presence: true

  scope :patient_name, ->(search) { where("first_name ILIKE :patient_name OR last_name ILIKE :patient_name", patient_name: "#{search}")}  

  def self.age
   Time.current.year - self.birthday
  end

end
