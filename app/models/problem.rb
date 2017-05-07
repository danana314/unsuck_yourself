class Problem < ApplicationRecord

	belongs_to :workout

	validates_presence_of :category, :difficulty, :problem,
	                      :correct_answer, :workout

	after_update :update_workout

	private

	def update_workout
		self.workout.problem_answered_callback
	end

end
