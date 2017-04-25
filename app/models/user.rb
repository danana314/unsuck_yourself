class User < ApplicationRecord
  rolify
	include Trackable

	validates_presence_of :email, :username
	validates_uniqueness_of :email
	validates_uniqueness_of :username

	attr_accessor :email_or_username

	def self.find_by_email_or_username string
		if string
			where("email LIKE ? OR username LIKE ?", string, string).first
		end
	end

  def admin?
	  self.has_role?(:admin)
  end

	def make_admin
		self.add_role :admin
	end

end
