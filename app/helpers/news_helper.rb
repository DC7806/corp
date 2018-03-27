module NewsHelper

  def news_summary locale, summary
    case locale
    when :'zh-TW'
      summary.truncate(70).html_safe
    when :en
      summary.truncate_words(20, separator: ' ').html_safe
    end
  end
  
end
