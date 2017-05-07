class GetNewWorkoutProblem < ServiceBase

	def initialize workout
		@workout = workout
	end

	def call
		# TODO, call correct problem generator depending on how far through the workout
		problem = CreateNewVanillaProblem.new(@workout).call
	end

end