class User < ApplicationRecord
	has_secure_password
	has_many :quotes
	has_many :meditation_sessions
	validates_presence_of :name, :last_name, :location, :password, :email
	validates_uniqueness_of :email

	def add_profile_pic

	end
	
end
