class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.string :permalink
      t.integer :sort

      t.timestamps
    end
  end
end
