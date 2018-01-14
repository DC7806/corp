class Image < ApplicationRecord
  # association
  belongs_to :imagable, polymorphic: true, optional: true

  # carrierwave
  mount_uploader :image, ImageUploader 
end

# t.string "image"
# t.string "image_alt"
# t.integer "sort"