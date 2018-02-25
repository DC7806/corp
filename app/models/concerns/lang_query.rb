module LangQuery
  
  # not working  
  def self.lang_query(locale)
    where(lang: locale)
  end

end