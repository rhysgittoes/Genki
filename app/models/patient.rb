
class Patients < ActiveRecord::Base
	has_many :health_profiles
end

class Patient < ApplicationRecord
end

