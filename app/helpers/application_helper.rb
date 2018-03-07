module ApplicationHelper

  def nav_locale locale
    if locale == :en 
      content_tag :li ,(link_to '中文', locale: :'zh-TW')
    elsif locale == :'zh-TW'
      content_tag :li ,(link_to 'EN', locale: :en)
    end
  end

end
