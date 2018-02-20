class Milestone < ApplicationRecord

  before_save :convert_lang

  validates :lang, :year, :content, presence: true
  
  def default_lang
    if self.lang == 'en'
      '英文'
    elsif self.lang == 'zh-TW'
      '中文'
    end
  end

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
