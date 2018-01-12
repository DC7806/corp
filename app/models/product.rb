class Product < ApplicationRecord
  # validation
  validates :name, :image, :model, :country, :permalink, presence: true 
  validates :permalink, uniqueness: true

  # association
  has_many :product_relations
  has_many :categories, through: :product_relations

  # translation
  extend Mobility
  translates :name, :inquiry, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :feature, :specification, :dimensions, :description, type: :text,  locale_accessors: [:en, :"zh-TW"]
end