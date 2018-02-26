class Page < ApplicationRecord
  has_one  :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true
end