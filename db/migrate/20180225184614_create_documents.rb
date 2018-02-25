class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :lang
      t.string :src
      t.references :documentable, polymorphic: true

      t.timestamps
    end
  end
end
