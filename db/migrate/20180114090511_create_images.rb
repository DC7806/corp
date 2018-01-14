class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image
      t.string :image_alt
      t.integer :sort
      t.references :imagable, polymorphic: true

      t.timestamps
    end
  end
end
