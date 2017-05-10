FactoryGirl.define do
  factory :problem do
	  problem_type 0
	  difficulty 0
	  problem '2 + 2'
	  correct_answer '4'

	  workout
  end
end
