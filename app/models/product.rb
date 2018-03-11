class Product < ApplicationRecord
  
  before_validation :set_default_values
  after_save :set_default_alt

  # validation
  validates :name, :model, :country, :permalink, presence: true 
  validates :permalink, uniqueness: true

  # association
  has_many :category_product_relations, dependent: :destroy
  has_many :categories, through: :category_product_relations
  has_many :certificate_product_relations, dependent: :destroy
  has_many :certificates, through: :certificate_product_relations
  
  has_many  :images, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many  :documents, as: :documentable, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true
  has_one  :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true

  # translation
  extend Mobility
  translates :name, :country, type: :string, locale_accessors: [:en, :"zh-TW"]
  translates :feature, :specification, :dimensions, :description, type: :text, locale_accessors: [:en, :"zh-TW"]

  # Carrierwave
  mount_uploader :document, AttachmentUploader

  def self.search query
    # better ways?
    obj = Mobility::ActiveRecord::StringTranslation
    .where(translatable_type: 'Product', locale: I18n.locale.to_s, key: 'name').where("value LIKE ?", "%#{query.downcase}%")
    where(id: [obj.pluck(:translatable_id)])

    
  end

  private

  def set_default_values
    self.country_zh_tw = "台灣" if self.country_zh_tw.blank?
    self.country_en = "Taiwan" if self.country_en.blank?
    self.permalink = model if self.permalink.blank?
    self.metum.title_zh_tw = name_zh_tw if self.metum.title_zh_tw.blank?
    self.metum.title_en = name_en if self.metum.title_en.blank?
    self.metum.og_title_zh_tw = name_zh_tw if self.metum.og_title_zh_tw.blank?
    self.metum.og_title_en = name_en if self.metum.og_title_en.blank?
  end

  # assign associated :images.alt default value 
  def set_default_alt
    {'zh-TW': name_zh_tw, 'en': name_en}.each do |locale, value|
      img = self.images.where(lang: locale).first
      img.update(alt: value) if img.alt.blank?
    end
  end

end