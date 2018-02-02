class AddLangToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :lang, :string
    rename_column :images, :image, :src
    rename_column :images, :image_alt, :alt
  end
end
