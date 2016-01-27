class Retailer < ActiveRecord::Base
	has_one :user, as: :usable 
	has_many :events
	has_many :sales, through: :events

	validates :point_of_contact, presence: true
	validates :contact_email, presence: true
	validates :zip_code, presence: true
	validates :retailer_name, presence: true
	validates :zip_code, format: { with: /(^\d{5}$)|(^\d{5}-\d{4}$)/,
    message: "either 12345 or 12345-1111 format" }
end
