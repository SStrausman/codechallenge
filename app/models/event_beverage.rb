class EventBeverage < ActiveRecord::Base
	belongs_to :event
	belongs_to :beverage
end
