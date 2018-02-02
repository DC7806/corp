class Metum < ApplicationRecord

  # association
  belongs_to :metable, polymorphic: true, optional: true
  
  # carrierwave
  mount_uploader :og_image, ImageUploader
  # mount_uploader :og_image_en, ImageUploader
  # mount_uploader :og_image_zh_tw, ImageUploader

  # translation
  extend Mobility
  translates :title, :meta_description, :og_title, :og_description, type: :string, locale_accessors: [:en, :"zh-TW"]

end

# t.string "page_name"
# t.string "title"
# t.string "meta_description"
# t.string "og_title"
# t.string "og_description"
# t.string "og_image"