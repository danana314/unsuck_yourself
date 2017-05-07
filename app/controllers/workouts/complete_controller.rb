class Workouts::CompleteController < ApplicationController

	def index
		@workout = current_user.workouts.last
	end

end
