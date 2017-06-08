class User < ApplicationRecord
  rolify
	include Trackable

  has_many :workouts
  has_many :skill_levels

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

	def generate_new_login_token!
		self.update!(login_token: SecureRandom.urlsafe_base64, login_token_valid_until: Time.now + 15.minutes)
	end
end
