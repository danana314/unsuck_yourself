class AddProblemTypeToProblems < ActiveRecord::Migration[5.0]
  def change
    remove_column :problems, :category
    add_column :problems, :problem_type, :integer, default: nil
  end
end
