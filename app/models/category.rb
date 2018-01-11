class Category < ApplicationRecord
  # validation
  validates :name, presence: true, uniqueness: true
  validates :permalink, presence: true, uniqueness: true

  # translation
  extend Mobility
  translates :name, type: :string,  locale_accessors: [:en, :"zh-TW"]
end