class Taster < ActiveRecord::Base
	has_one :user, as: :usable
	has_many :attendances
	has_many :events, through: :attendances
	has_many :taster_assessments
	has_many :assessments, through: :taster_assessments

	validates :real_name, presence: true
end
