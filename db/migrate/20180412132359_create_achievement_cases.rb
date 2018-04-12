class CreateAchievementCases < ActiveRecord::Migration[5.1]
  def change
    create_table :achievement_cases do |t|
      t.string :title
      t.string :description
      t.integer :sort
      t.boolean :is_highlight, default: false
      t.references :achievement, foreign_key: true

      t.timestamps
    end
  end
end
