class Sale < ActiveRecord::Base
	belongs_to :event
	belongs_to :beverages
end
