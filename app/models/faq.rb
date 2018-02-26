class Faq < ApplicationRecord
  
  include LangDefaultValues
  
  before_save :convert_lang

  # validation
  validates :lang, :question, :answer, presence: true

end