tclass Attendance < ActiveRecord::Base
	belongs_to :taster
	belongs_to :event
end
