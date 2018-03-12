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

  def nav_logo site_name, logo
    if action_name == 'homepage'
      link_to root_path do
        (content_tag :h1 , site_name, style: 'text-indent: -9999px; position: absolute')+
        (image_tag logo, alt: site_name)
      end
    else
      link_to root_path do
        image_tag logo, alt: site_name
      end
    end
  end

  def breadcrumbs_wrapper_class
    'my-sm-10' if action_name != 'homepage'
  end

end