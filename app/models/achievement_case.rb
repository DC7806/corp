class AchievementCase < ApplicationRecord

  # validation
  validates :title_zh_tw, :title_en, presence: true

  # association
  belongs_to :achievement
  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  # translation
  extend Mobility
  translates :title, :description, type: :string, locale_accessors: [:en, :"zh-TW"]

  # sortable
  include RailsSortable::Model
  set_sortable :sort, without_updating_timestamps: true

end
