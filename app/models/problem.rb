class Problem < ApplicationRecord

	belongs_to :workout

	validates_presence_of :problem_type, :skill_level, :problem,
		:correct_answer, :workout

end
