class GradeProblem < ServiceBase

	def initialize problem, user_answer
		@problem = problem
		@user_answer = user_answer
	end

	def call
		# TODO, strip whitespace
		correct = @problem.correct_answer == @user_answer

		@problem.user_answer = @user_answer
		@problem.correct = correct
		@problem.answered_at = Time.zone.now

		@problem.save!
	end
end