class Doctor < User
  has_many :patients
  has_many :prescriptions
  has_many :appointments


  # validates :certification, presence: true
  # validates :experience, presence: true



  # scope :search, ->(search) { where("first_name ILIKE :search OR last_name ILIKE :search OR admission_id ILIKE :search ", search: "#{search}")}  

  # def self.age
  #  Time.current.year - self.birthday
  # end

end
