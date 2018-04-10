class Document < ApplicationRecord

  ## not working on Download
  validates :src, presence: true, if: :is_download?

  # association
  belongs_to :documentable, polymorphic: true, optional: true
  
  # carrierwave
  mount_uploader :src, AttachmentUploader

  private
  # only validates Download class
  def is_download?
    self.documentable_type == 'Download'
  end

end
