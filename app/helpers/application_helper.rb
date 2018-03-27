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

  def google_map_js
    if action_name == 'homepage' or action_name == 'contact'
      javascript_include_tag '', src: 'https://maps.googleapis.com/maps/api/js?key=AIzaSyDqRZdw23nabFTCp8uRZWHvwxRR0DgSoFc'
    end
  end

  def nav_locale locale
    case locale
      when :en then content_tag :li ,(link_to '中文', locale: :'zh-TW')
      when :'zh-TW' then content_tag :li ,(link_to 'EN', locale: :en)
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

  def analytics_tags(gtm, ga)
    {'gtm': gtm,'ga': ga}.map do |key, value|
      render "layouts/analytics/#{key}" if value.present?
    end.join.html_safe
  end

  def frontend_notice_msg
    if flash.present?
      flash.each do |type, msg|
        alert_class = case type.to_sym
                      when :notice then 'msg-sent'
                      when :alert  then 'msg-failed'
                      end
        return  content_tag :div, id: 'notification', class: "text-center msg #{alert_class}" do
                  content_tag :p, msg, class: 'py-xs-0'
                end
      end
    end  
  end

end