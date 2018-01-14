class CreateMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :meta do |t|
      t.string :page_name
      t.string :title
      t.string :meta_description
      t.string :og_title
      t.string :og_description
      t.string :og_image
      t.references :metable, polymorphic: true

      t.timestamps
    end
  end
end
