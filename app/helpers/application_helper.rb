module ApplicationHelper

  def page_title site_name, title
    if title.present?
      content_tag :title, "#{title} | #{site_name}"
    else
      content_tag :title, site_name
    end
  end

  def meta_desc_tag(desc)
    tag(:meta, name: 'description', content: desc) unless desc.nil?
  end

  def og_tag(hsh)
    hsh.map {|key, value| tag(:meta, property: "og:#{key}" , content: value)}.inject(&:+) if hsh.present?
  end

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

  def breadcrumbs_wrapper_class
    'my-sm-10' unless action_name == 'homepage'
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
  
  def notice_msg
    if flash.present?
      flash.each do |type, msg|
        alert_class = case type.to_sym
                      when :notice then 'alert-info'
                      when :alert  then 'alert-danger'
                      end
        return  content_tag :div, class: "alert #{alert_class}" do
                (button_tag type: "button", class: "close", data: {dismiss: "alert"} do
                  content_tag :span, data: {hidden: true} do 
                    "&times;".html_safe
                  end
                end) + msg
               end
      end
    end  
  end

end
