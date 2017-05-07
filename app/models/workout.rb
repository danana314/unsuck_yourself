class Workout < ApplicationRecord

	belongs_to :user
	has_many :problems

	validates_presence_of :user, :progress

	def complete?
		self.progress >= 100
	end

	def problem_answered_callback
		if self.problems.last.correct?
			increment_amount = 10
		else
			increment_amount = 5
		end

		self.update_attribute(:progress, progress + increment_amount)
	end

end
