class RenameProductRelationToCategoryProductRelation < ActiveRecord::Migration[5.1]
  def change
    rename_table :product_relations, :category_product_relations
  end
end
