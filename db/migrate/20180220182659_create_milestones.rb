class CreateMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :milestones do |t|
      t.string :lang
      t.string :year
      t.text :content

      t.timestamps
    end
  end
end
