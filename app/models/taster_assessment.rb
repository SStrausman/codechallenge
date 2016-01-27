class TasterAssessment < ActiveRecord::Base
	belongs_to :taster
	belongs_to :assessment
end
