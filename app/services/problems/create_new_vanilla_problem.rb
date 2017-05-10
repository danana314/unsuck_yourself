class CreateNewVanillaProblem < ServiceBase

	def initialize workout, problem_type_symbol
		@problem_type_symbol = problem_type_symbol
		@workout = workout
	end

	def call
		new_problem_hash = VanillaEngine.new(@problem_type_symbol, 1).generate

		problem = new_problem_hash[:problem].join("\n")
		answer = new_problem_hash[:answer]

		Problem.create!(problem_type: @problem_type_symbol,
		                difficulty: 1,
		                problem: problem,
		                correct_answer: answer,
		                workout: @workout
		)
	end
end