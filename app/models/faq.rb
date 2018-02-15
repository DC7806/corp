class Faq < ApplicationRecord
  
  before_save :convert_lang

  validates :lang, :question, :answer, presence: true
  
  private
  def convert_lang
    lang = self.lang
    case lang
    when '中文'
      self.lang = 'zh-TW'
    when '英文'
      self.lang = 'en'  
    end
  end
end