class News < ApplicationRecord
  
  # validation
  validates :title, presence: true
  validates :permalink, presence: true, uniqueness: true
  
  # association
  has_one :image, as: :imagable, dependent: :destroy
  # accepts_nested_attributes_for :image, allow_destroy: true
  has_one :metum, as: :metable, dependent: :destroy

  # translation
  extend Mobility
  translates :title, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :content, type: :text, locale_accessors: [:en, :"zh-TW"]

end