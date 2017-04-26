class SkillLevel < ApplicationRecord

	belongs_to :user

	validates_presence_of :problem_type, :level, :user

end
