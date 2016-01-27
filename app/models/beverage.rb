evclass Beverage < ActiveRecord::Base
	belongs_to :brand
	has_many :event_beverages
	has_many :events, through: :event_beverages
end
