class CreateNewVanillaProblem < ServiceBase

	def initialize workout
		@workout = workout
	end

	def call
		# TODO CALL ENGINE HERE
		problem = rand(1..3).to_s + '+' + rand(1..3).to_s
		answer = eval problem

		Problem.create!(category: 'test',
		                difficulty: 1,
		                problem: problem,
		                correct_answer: answer,
		                workout: @workout
		)
	end
end