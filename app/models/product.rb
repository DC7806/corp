class Product < ApplicationRecord
  
  # validation
  validates :name, :model, :country, :permalink, presence: true 
  validates :permalink, uniqueness: true

  # association
  has_many :category_product_relations, dependent: :destroy
  has_many :categories, through: :category_product_relations
  has_many :certificate_product_relations, dependent: :destroy
  has_many :certificates, through: :certificate_product_relations
  
  has_one  :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_one  :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true

  # translation
  extend Mobility
  translates :name, :inquiry, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :feature, :specification, :dimensions, :description, type: :text,  locale_accessors: [:en, :"zh-TW"]

end