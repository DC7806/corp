class Download < ApplicationRecord

  include LangDefaultSettings
    
  before_save :convert_lang

  # validation
  validates :title, presence: true

  # association
  has_one :document, as: :documentable, dependent: :destroy
  accepts_nested_attributes_for :document, allow_destroy: true, reject_if: proc { |attributes| attributes[:src].blank? }

end
