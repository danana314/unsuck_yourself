class User < ApplicationRecord
	validates_presence_of :email, :username
	validates_uniqueness_of :email
	validates_uniqueness_of :username

	###
	attr_accessor :email_or_username

	# Class methods
	def self.find_by_email_or_username string
		if string
			where("email LIKE ? OR username LIKE ?", string, string).first
		end
	end
end
