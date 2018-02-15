class Certificate < ApplicationRecord
  
  # validation
  # validates :name, :image, presence: true 

  # association
  has_many :certificate_product_relations
  has_many :products, through: :certificate_product_relations

  # carrierwave
  mount_uploader :image, ImageUploader

  # translation
  extend Mobility
  translates :name, type: :string, locale_accessors: [:en, :"zh-TW"]
  
end
