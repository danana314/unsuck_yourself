class GetNewWorkoutProblem < ServiceBase

	def initialize workout
		@workout = workout
	end

	def call

		# Check workout type

			# If mixed, change type depending on progress

			# Otherwise, create problem accordingly

		# TODO, call correct problem generator depending on how far through the workout
		problem = CreateNewVanillaProblem.new(@workout, :addition).call
	end

end