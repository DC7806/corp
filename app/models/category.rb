class Category < ApplicationRecord
  before_validation :set_default_values

  # validation
  validates :name, presence: true, uniqueness: true
  validates :permalink, presence: true, uniqueness: true

  # association
  has_many :category_product_relations
  has_many :products, through: :category_product_relations
  has_one :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true

  # translation
  extend Mobility
  translates :name, type: :string, locale_accessors: [:en, :"zh-TW"]

  private

  def set_default_values
    self.permalink = name_en.parameterize if self.permalink.blank?
    self.metum.title_zh_tw = name_zh_tw if self.metum.title_zh_tw.blank?
    self.metum.title_en = name_en if self.metum.title_en.blank?
    self.metum.og_title_zh_tw = name_zh_tw if self.metum.og_title_zh_tw.blank?
    self.metum.og_title_en = name_en if self.metum.og_title_en.blank?
  end

end