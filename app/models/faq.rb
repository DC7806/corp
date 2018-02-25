class Faq < ApplicationRecord
  
  include LangDefaultSettings
  # include LangQuery
  
  before_save :convert_lang

  # validation
  validates :lang, :question, :answer, presence: true
  
  def self.lang_query(locale)
    where(lang: locale)
  end

end