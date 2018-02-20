class News < ApplicationRecord
  before_validation :set_default_values

  # validation
  validates :title, presence: true
  validates :permalink, presence: true, uniqueness: true
  
  # association
  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_one :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true

  # translation
  extend Mobility
  translates :title, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :content, type: :text, locale_accessors: [:en, :"zh-TW"]

  private

  def set_default_values
    self.image.alt = title_en.parameterize
    self.permalink = title_en.parameterize if self.permalink.blank?
    self.metum.title_zh_tw = title_zh_tw if self.metum.title_zh_tw.blank?
    self.metum.title_en = title_en if self.metum.title_en.blank?
    self.metum.og_title_zh_tw = title_zh_tw if self.metum.og_title_zh_tw.blank?
    self.metum.og_title_en = title_en if self.metum.og_title_en.blank?
  end

end