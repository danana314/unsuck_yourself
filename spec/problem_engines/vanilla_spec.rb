require 'rails_helper'

describe VanillaEngine do

	let(:user){FactoryGirl.create(:user)}
	let(:workout){FactoryGirl.create(:workout, user: user)}

	context "#initialize and #generate" do
		it 'create a problem with a provided problem_type and skill_level' do
			problem = VanillaEngine.new(:addition, 1).generate
			expect(problem.keys).to eq [:problem, :answer]
			expect(problem[:problem].class).to eq Array
			expect(problem[:answer].class).to eq Fixnum
		end

		it 'raises an error if an invalid problem type is provided' do
			expect { VanillaEngine.new(:your_mom, 1).generate }
				.to raise_error(RuntimeError, "problem type :your_mom not valid")
		end
	end
end
