class Milestone < ApplicationRecord

  include LangDefaultValues

  before_save :convert_lang

  validates :lang, :year, :content, presence: true
  
end
