class Workout < ApplicationRecord

	belongs_to :user
	has_many :problems

	validates_presence_of :user, :progress

	#######################
	# Callbacks
	#######################

	def problem_answered_callback
		if self.problems.last.correct?
			increment_amount = 10
		else
			increment_amount = -5
		end

		new_progress = self.progress + increment_amount
		new_progress = 0 if new_progress < 0

		self.update_attribute(:progress, new_progress)
	end

	#######################
	# Queries
	#######################

	def complete?
		self.progress >= 100
	end

end
