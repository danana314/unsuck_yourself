class Problem < ApplicationRecord

	belongs_to :workout

	validates_presence_of :category, :difficulty, :problem,
		:correct_answer, :workout

end
