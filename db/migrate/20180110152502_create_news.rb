class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.text :content
      t.string :permalink

      t.timestamps
    end
  end
end
