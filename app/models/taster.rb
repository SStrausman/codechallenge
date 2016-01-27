class Taster < ActiveRecord::Base
	has_one :user, as: :usable
	has_many :attendances, through: :users
	has_many :events, through: :attendances
	has_many :user_assessments
	has_many :assessments, through: :user_assessments
end
