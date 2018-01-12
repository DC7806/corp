class Category < ApplicationRecord
  # validation
  validates :name, presence: true, uniqueness: true
  validates :permalink, presence: true, uniqueness: true

  # association
  has_many :category_product_relations
  has_many :products, through: :category_product_relations

  # translation
  extend Mobility
  translates :name, type: :string,  locale_accessors: [:en, :"zh-TW"]
end