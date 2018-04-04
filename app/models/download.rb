class Download < ApplicationRecord

  include LangDefaultValues
    
  before_save :convert_lang

  # validation
  validates :title, presence: true

  # association
  has_one :document, as: :documentable, dependent: :destroy, required: true
  accepts_nested_attributes_for :document, allow_destroy: true

end
