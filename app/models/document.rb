class Document < ApplicationRecord

  ## not working
  # validates :src, presence: true

  #belongs_to :documentable, polymorphic: true
  belongs_to :documentable, polymorphic: true, optional: true
  
  # carrierwave
  mount_uploader :src, AttachmentUploader

end
