class CreateCarousels < ActiveRecord::Migration[5.1]
  def change
    create_table :carousels do |t|
      t.string :title
      t.string :description
      t.string :cta
      t.integer :sort

      t.timestamps
    end
  end
end
