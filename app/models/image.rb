class Image < ApplicationRecord

  # association
  belongs_to :imagable, polymorphic: true, optional: true

  # carrierwave
  mount_uploader :src, ImageUploader

end