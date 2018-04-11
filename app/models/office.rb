class Office < ApplicationRecord

  # validation
  validates :title_zh_tw, :address_zh_tw, :number_zh_tw, :contact_zh_tw, :email_zh_tw, presence: true
  validates :email_zh_tw, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  # translation
  extend Mobility
  translates :title, :address, :number, :fax, :email, :contact, type: :string, locale_accessors: [:en, :"zh-TW"]

  # sortable
  include RailsSortable::Model
  set_sortable :sort, without_updating_timestamps: true
  
end
