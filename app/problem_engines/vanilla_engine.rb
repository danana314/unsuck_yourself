class VanillaEngine < EngineBase

  def initialize skill_level
      @skill_level = skill_level
	end

	def generate
      # generate and return problem with skill level
      operators = ['+', '-', '*'] #'/'
      operand1 = rand(1..10).to_s
      operator = operators.[] rand operators.length
      operand2 = rand(1..10).to_s
      expression = [operand1, operator, operand2]
      answer = evaluate_expression expression.join
      { problem: expression, answer: answer }
  end

	private
  def evaluate_expression expr
    if valid_syntax? expr
          eval(expr)
      else
          raise 'Only digits and mathematical operators allowed...whatchu tryna do?'
      end
  end
  def valid_syntax? expr
      # Only allow digits and +-*/
      pattern = /[^\d\+\-\*\/\(\)]/
      expr.scan(pattern).empty?
  end
end
