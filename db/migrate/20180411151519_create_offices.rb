class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.string :title
      t.string :address
      t.string :number
      t.string :fax
      t.string :email
      t.string :contact
      t.integer :sort

      t.timestamps
    end
  end
end
