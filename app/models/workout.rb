class Workout < ApplicationRecord

	belongs_to :user
	has_many :problems

	validates_presence_of :user, :progress


end
