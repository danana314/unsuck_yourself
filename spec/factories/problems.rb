FactoryGirl.define do
  factory :problem do
	  category 'basic'
	  difficulty 0
	  problem '2 + 2'
	  correct_answer '4'

	  workout
  end
end
