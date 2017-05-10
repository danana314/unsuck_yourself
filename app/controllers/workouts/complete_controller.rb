class Workouts::CompleteController < ApplicationController

	def index
		@workout = current_user.workouts.completed.last
	end

end
