module WorkoutsHelper

	def workout_summary workout
		total_problems = workout.problems.answered.count
		total_correct = workout.problems.answered.correct.count
		correct_percentage = ((total_correct.to_f/total_problems.to_f) * 100).round

		html = ''
		html += content_tag(:h1, get_summary_heading(correct_percentage))
		html += content_tag(:p, "#{total_correct} out of #{total_problems} correct-- #{correct_percentage}%")
		html.html_safe
	end

	def get_summary_heading correct_percentage
		 if correct_percentage > 90.0
			 'Pretty good'
		 elsif correct_percentage >= 80.0
			 'Not terrible'
		 elsif correct_percentage >= 50.0
			 'Not great'
		 else
			 'How old are you?'
		 end
	end

end
