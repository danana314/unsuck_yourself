class User < ApplicationRecord
	validates_presence_of :email
	validates_uniqueness_of :username, if: Proc.new {|u| !u.username.blank?}
end
