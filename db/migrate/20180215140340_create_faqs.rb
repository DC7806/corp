class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
      t.string :lang
      t.text :question
      t.text :answer
      t.string :sort

      t.timestamps
    end
  end
end
