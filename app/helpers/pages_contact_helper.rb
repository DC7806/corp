module PagesContactHelper
  def hq_contact_info(en, zh)
    if I18n.locale == :en
      en.values.first.map do |k,v|
        content_tag :div, class: 'col-sm-3' do
          (content_tag :h4, k, class: 'title') + (content_tag :p, v)
        end
      end.inject(&:+)
    elsif I18n.locale == :'zh-TW'
      zh.values.first.map do |k,v|
        content_tag :div, class: 'col-sm-3' do
          (content_tag :h4, k, class: 'title') + (content_tag :p, v)
        end
      end.inject(&:+)
    end
  end

  def regions_contact_info(regions)
    if I18n.locale == :'zh-TW'
      (content_tag :h2, '各區營業所', class: 'text-center') + 
      regions.map do |k,v|
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
end