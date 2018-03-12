class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :language, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

end
