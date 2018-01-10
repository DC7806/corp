class News < ApplicationRecord
  # validation
  validates :title, presence: true
  
  # translation
  extend Mobility
  translates :title, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :content, type: :text, locale_accessors: [:en, :"zh-TW"]
end
