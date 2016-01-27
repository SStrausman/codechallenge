class User < ActiveRecord::Base
	belongs_to :usable, polymorphic: true

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, presence: true
end
