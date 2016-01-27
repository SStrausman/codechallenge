class Event < ActiveRecord::Base
	has_many :photos
	has_many :attendances
	has_many :attendees, through: :attendances, source: :users
	has_one :brand
	has_one :retailer

	validates :location, presence: true
	validates :event_date, presence:  true
end
