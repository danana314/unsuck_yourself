class VanillaEngine < EngineBase

  def initialize problem_type_symbol, skill_level
    @problem_type_symbol = problem_type_symbol
    @skill_level = skill_level
	end

	def generate
    operand1 = rand(1..10).to_s
    operator = get_operator @problem_type_symbol
    operand2 = rand(1..10).to_s
    expression = [operand1, operator, operand2]
    answer = evaluate_expression expression.join
    { problem: expression, answer: answer }
  end

	private

  def get_operator problem_type_symbol
    raise "problem type :#{problem_type_symbol} not valid" unless Problem.problem_types.keys.include? problem_type_symbol.to_s
    case problem_type_symbol
      when :addition
        '+'
      when :subtraction
        '-'
      when :multiplication
        '*'
      else
        raise "problem type :#{problem_type_symbol} exists but not defined in VanillaEngine! Unsuck YOURSELF"
    end
  end

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
