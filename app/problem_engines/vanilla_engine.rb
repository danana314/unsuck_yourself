class VanillaEngine < EngineBase

  def initialize problem_type_symbol, skill_level
    @problem_type_symbol, @skill_level = problem_type_symbol, skill_level
    check_problem_type_symbol
  end

	def generate
    operand1 = get_operand @problem_type_symbol, @skill_level
    operator = get_operator @problem_type_symbol
    operand2 = get_operand @problem_type_symbol, @skill_level
    expression = [operand1, operator, operand2]
    answer = evaluate_expression expression.join
    { problem: expression, answer: answer }
  end

	private

  def get_operand problem_type_symbol, skill_level
    case problem_type_symbol
      when :addition
        # TODO, make number relative to skill_level
        rand(1..100).to_s
      when :subtraction
        rand(1..100).to_s
      when :multiplication
        rand(1..12).to_s
      else
        raise "problem type :#{problem_type_symbol} exists but not defined in VanillaEngine#get_operand. Unsuck YOURSELF"
    end
  end

  def get_operator problem_type_symbol
    case problem_type_symbol
      when :addition
        '+'
      when :subtraction
        '-'
      when :multiplication
        '*'
      else
        raise "problem type :#{problem_type_symbol} exists but not defined in VanillaEngine#get_operator. Unsuck YOURSELF"
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

  def check_problem_type_symbol
    raise "problem type :#{problem_type_symbol} not valid" unless Problem.problem_types.keys.include? @problem_type_symbol.to_s
  end

end
