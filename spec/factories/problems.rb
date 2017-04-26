FactoryGirl.define do
  factory :problem do
	  problem_type 'basic'
	  skill_level 0
	  problem '2 + 2'
	  correct_answer '4'

	  workout
  end
end
