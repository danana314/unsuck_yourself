class WorkoutsController < ApplicationController

	def new
		@workout = Workout.create!(user: current_user)
		redirect_to workout_path @workout
	end

	def show
		get_workout
		get_new_problem
	end

	def update
		get_workout
		grade_problem

		if @workout.complete?
			redirect_to workouts_complete_index_path
		else
			get_new_problem
			render action: :show
		end
	end

	private

	def get_workout
		@workout = Workout.find(params[:id])
	end

	def get_new_problem
		@problem = GetNewWorkoutProblem.new(@workout).call
	end

	def grade_problem
		problem = @workout.problems.last
		user_answer = params.require(:problem)[:user_answer]
		GradeProblem.new(problem, user_answer).call
	end

end
