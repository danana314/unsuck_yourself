class Problem < ApplicationRecord

	belongs_to :workout

	validates_presence_of :problem_type, :difficulty, :problem,
	                      :correct_answer, :workout

	after_update :update_workout

	enum problem_type: {
		addition: 0,
		subtraction: 1,
		multiplication: 2
	}

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
