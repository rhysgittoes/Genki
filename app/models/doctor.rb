class Doctor < User
  has_many :patients
  has_many :prescriptions


  # validates :certification, presence: true
  # validates :experience, presence: true


  scope :patient_name, ->(search) { where("first_name ILIKE :patient_name OR last_name ILIKE :patient_name", patient_name: "#{search}")}  

  # def self.age
  #  Time.current.year - self.birthday
  # end

end
