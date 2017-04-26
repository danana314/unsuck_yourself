class SkillLevel < ApplicationRecord

	belongs_to :user

	validates_presence_of :category, :level, :user

end
