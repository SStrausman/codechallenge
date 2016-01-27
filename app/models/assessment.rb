class Assessment < ActiveRecord::Base
	has_many :questions
	has_many :user_assessments
	has_many :users, through: :user_assessments

	validates :title, presence: true
	validates :title, uniqueness: true
end
