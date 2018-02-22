class AddPrefixToInquiry < ActiveRecord::Migration[5.1]
  def change
    add_column :inquiries, :last_name, :string
    add_column :inquiries, :prefix, :string
    rename_column :inquiries, :name, :first_name
  end
end
