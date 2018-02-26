module LangQuery
  
  extend ActiveSupport::Concern

  included do
   
    def self.lang_query(locale)
      where(lang: locale)
    end  
    
  end
  

end