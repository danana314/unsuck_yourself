class Problem < ApplicationRecord

	belongs_to :workout

	validates_presence_of :category, :difficulty, :problem,
	                      :correct_answer, :workout

	after_update :update_workout

	#######################
	# Queries
	#######################

	def self.answered
		where.not(user_answer: nil)
	end

	def self.correct
		where(correct: true)
	end

	private

	def update_workout
		self.workout.problem_answered_callback
	end

end
