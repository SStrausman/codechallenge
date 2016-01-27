class Brand < ActiveRecord::Base

	has_one :user
	has_many :beverages
	has_many :events

	validates :point_of_contact, presence: true 
	validates :contact_email, presence: true
	validates :brand_name, presence: true
	validates :brand_name, uniqueness: true

end
