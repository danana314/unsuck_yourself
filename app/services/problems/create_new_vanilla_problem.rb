class CreateNewVanillaProblem < ServiceBase

	def initialize workout
		@workout = workout
	end

	def call
		new_problem_hash = VanillaEngine.new(1).generate

		problem = new_problem_hash[:problem].join(' ')
		answer = new_problem_hash[:answer]

		Problem.create!(category: 'test',
		                difficulty: 1,
		                problem: problem,
		                correct_answer: answer,
		                workout: @workout
		)
	end
end