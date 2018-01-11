class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :model
      t.string :country
      t.string :document
      t.string :inquiry
      t.string :permalink
      t.text :feature
      t.text :specification
      t.text :dimensions
      t.text :description
      t.timestamps
    end
  end
end
