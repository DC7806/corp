class Product < ApplicationRecord
  # validation
  validates :name, :image, :model, :country, :permalink, presence: true 
  validates :permalink, uniqueness: true

  # association
  has_many :category_product_relations
  has_many :categories, through: :category_product_relations
  has_many :certificate_product_relations
  has_many :certificates, through: :certificate_product_relations

  # translation
  extend Mobility
  translates :name, :inquiry, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :feature, :specification, :dimensions, :description, type: :text,  locale_accessors: [:en, :"zh-TW"]
end