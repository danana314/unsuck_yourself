class CreateSkillLevelsWorkoutsAndProblems < ActiveRecord::Migration[5.0]
  def change

    create_table :skill_levels do |t|
      t.string :problem_type
      t.integer :level
      t.references :user, null: false, index: true

      t.timestamps
    end

    create_table :workouts do |t|
      t.integer :progress, default: 0
      t.references :user, null: false, index: true

      t.timestamps
    end

    create_table :problems do |t|
      t.string :problem_type
      t.integer :skill_level
      t.string :problem
      t.string :correct_answer
      t.string :user_answer
      t.boolean :correct, default: nil

      t.references :workout, null: false, index: true

      t.timestamps
    end

  end
end
