class CreateSkillLevelsWorkoutsAndProblems < ActiveRecord::Migration[5.0]
  def change

    create_table :skill_levels do |t|
      t.string :category
      t.integer :level
      t.references :user, null: false, index: true

      t.timestamps
    end

    create_table :workouts do |t|
      t.integer :progress, default: 0
      t.references :user, null: false, index: true
      t.datetime :finished_at

      t.timestamps
    end

    create_table :problems do |t|
      t.string :category
      t.integer :difficulty
      t.text :problem
      t.string :correct_answer
      t.string :user_answer
      t.boolean :correct, default: nil
      t.datetime :answered_at
      t.references :workout, null: false, index: true

      t.timestamps
    end

  end
end
