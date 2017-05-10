class GetNewWorkoutProblem < ServiceBase

	def initialize workout
		@workout = workout
	end

	def call
		case @workout.workout_type

			when 'mixed'
				if @workout.progress < 33
					problem = CreateNewVanillaProblem.new(@workout, :addition).call
				elsif @workout.progress < 66
					problem = CreateNewVanillaProblem.new(@workout, :subtraction).call
				else
					problem = CreateNewVanillaProblem.new(@workout, :multiplication).call
				end

			when 'addition'
	      problem = CreateNewVanillaProblem.new(@workout, :addition).call

			when 'subtraction'
				problem = CreateNewVanillaProblem.new(@workout, :subtraction).call

			when 'multiplication'
				problem = CreateNewVanillaProblem.new(@workout, :multiplication).call

			else
				raise "workout type :#{@workout.workout_type} not defined yet in GetNewWorkoutProblem!"

		end
	end

end