class Product < ApplicationRecord
    # validation
  validates :name, :image, :model, :country, :permalink, presence: true 
  validates :name, :permalink, uniqueness: true

  # translation
  extend Mobility
  translates :name, :inquiry, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :feature, :specification, :dimensions, :description, type: :text,  locale_accessors: [:en, :"zh-TW"]
end