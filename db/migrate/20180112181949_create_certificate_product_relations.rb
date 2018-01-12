class CreateCertificateProductRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :certificate_product_relations do |t|
      t.references :certificate, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
