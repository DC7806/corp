class RemoveImageFromProductsAndNews < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :image
    remove_column :news, :image
  end
end
