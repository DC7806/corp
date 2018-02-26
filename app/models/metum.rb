class Metum < ApplicationRecord

  # association
  belongs_to :metable, polymorphic: true, optional: true
  
  # carrierwave
  mount_uploader :og_image, ImageUploader

  # translation
  extend Mobility
  translates :title, :meta_description, :og_title, :og_description, type: :string, locale_accessors: [:en, :"zh-TW"]

end