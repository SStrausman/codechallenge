class Question < ActiveRecord::Base
	belongs_to :assessment

	validates :prompt, presence: true
	validates :answer, presence: true
end
