module PagesHelper
  
  def contact_info_hq(locale)
    case locale
      when :'zh-TW'
        lang = 'hq_zh'
      when :en
        lang = 'hq_en'
    end
    @contacts.slice(lang).values.first.map do |k,v|
      content_tag :div, class: 'col-sm-3' do
        (content_tag :h4, k, class: 'title') + (content_tag :p, v)
      end
    end.inject(&:+)
  end

  def contact_info_regions(locale)
    if I18n.locale == :'zh-TW'
      (content_tag :h2, '各區營業所', class: 'text-center') + 
      @contacts_regions.map do |k,v|
        content_tag :div, class: 'col-sm-4 mt-sm-15' do
          content_tag :div, class: 'col-sm-10 col-sm-offset-1' do
            (content_tag :h4, k) +
            v.map do |k1, v1|
              (content_tag :p, k1 + '：' + v1)
            end.inject(&:+)
          end
        end
      end.inject(&:+) 
    end
  end

  def faq_list(locale)
    @faqs.lang_query(locale).map do |faq|
      content_tag :div, class: 'faq-item mb-xs-20' do
        (content_tag :a, href: '#' do 
        (content_tag :h4, faq.question, class: 'my-xs-15')+
        (content_tag :i, '', class: 'text-center fa fa-angle-down rotate-180 mb-xs-5')
        end)+
        (content_tag :div, faq.answer.html_safe)
      end
    end.inject(&:+)
  end

  def about_sections(locale, section)
    case locale
      when :'zh-TW'
        lang = 'zh_tw'
      when :en
        lang = 'en'
    end
    @about.slice(lang).values.first[section].html_safe
  end

end
