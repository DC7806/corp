module ApplicationHelper

  def nav_locale locale
    if locale == :en 
      content_tag :li ,(link_to '中文', locale: :'zh-TW')
    elsif locale == :'zh-TW'
      content_tag :li ,(link_to 'EN', locale: :en)
    end
  end

  def nav_wrapper_class
    'op-nav menu-transparent js-transparent' if action_name == 'homepage'
  end

  def nav_wrapper_inner_class
    if action_name == 'homepage'
      'container-fluid'
    else
      'container'
    end
  end

end
