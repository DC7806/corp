class Document < ApplicationRecord

  ## not working on Download
  # validates :src, presence: true

  # association
  belongs_to :documentable, polymorphic: true, optional: true
  
  # carrierwave
  mount_uploader :src, AttachmentUploader

end
