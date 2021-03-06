class Assessment < ActiveRecord::Base
	has_many :questions
	has_many :taster_assessments
	has_many :tasters, through: :taster_assessments

	validates :title, presence: true
	validates :title, uniqueness: true
end
