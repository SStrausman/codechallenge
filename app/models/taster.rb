class Taster < ActiveRecord::Base
	has_one :user, as: :usable
	has_many :attendances
	has_many :events, through: :attendances
	has_many :user_assessments
	has_many :assessments, through: :user_assessments

	validates :real_name, presence: true
end
