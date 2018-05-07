module PagesHelper

  def carousel_active carousel
    'active' if carousel.sort == 0
  end

  def carousel_cta carousel
    if carousel.cta.present? 
      link_to t('frontend.button.enter'), carousel.cta, class: 'btn btn-md btn-style-3 mt-xs-30'
    end
  end

  # def contact_info_hq(locale, contacts)
  #   case locale
  #     when :'zh-TW'
  #       lang = 'hq_zh'
  #     when :en
  #       lang = 'hq_en'
  #   end
  #   contacts.fetch(lang).map do |k,v|
  #     content_tag :div, class: 'col-sm-3' do
  #       (content_tag :h4, k, class: 'title') + (content_tag :p, v)
  #     end
  #   end.inject(&:+)
  # end

  # def contact_info_regions(locale, contacts_regions)
  #   if I18n.locale == :'zh-TW'
  #     (content_tag :h2, '各區營業所', class: 'text-center') + 
  #     contacts_regions.map do |k,v|
  #       content_tag :div, class: 'col-sm-4 mt-sm-15' do
  #         content_tag :div, class: 'col-sm-10 col-sm-offset-1' do
  #           (content_tag :h4, k) +
  #           v.map do |k1, v1|
  #             (content_tag :p, k1 + '：' + v1)
  #           end.inject(&:+)
  #         end
  #       end
  #     end.inject(&:+) 
  #   end
  # end

  def contact_offices locale, offices
    yield offices if locale == :'zh-TW'
  end

  def faq_list(list, locale)
    list.lang_query(locale).map do |faq|
      content_tag :div, class: 'faq-item mb-xs-20' do
        (content_tag :a, href: '#' do 
        (content_tag :h4, faq.question, class: 'my-xs-15')+
        (content_tag :i, '', class: 'text-center fa fa-angle-down rotate-180 mb-xs-5')
        end)+
        (content_tag :div, faq.answer.html_safe, class: 'hidden')
      end
    end.inject(&:+)
  end

  def download_list(list, locale)
    list.lang_query(locale).map do |download|
      content_tag :div, class: 'clear mt-xs-20 border py-xs-15 overflow-auto' do
        link_to download.document.src.url, target: '_blank' do 
          (content_tag :span, download.created_at.to_date, class: 'col-sm-3 col-md-2')+
          (content_tag :h4, download.title, class: 'col-sm-7 col-md-8 my-xs-0')+
          (content_tag :div, class: 'block col-sm-2 text-center' do
            content_tag :i, '', class: 'ti-download'
          end)
        end
      end
    end.inject(&:+)
  end

  def raw_contents locale, src, section
    src.fetch(locale.to_s)[section].html_safe
  end

  def milestone_list(list, locale)
    list.lang_query(locale).map do |milestone|
      content_tag :div, class: 'clear mt-xs-20 border py-xs-15 overflow-auto' do
        (content_tag :span, milestone.year, class: 'col-sm-2')+
        (content_tag :h4, milestone.content, class: 'col-sm-10 my-xs-0')
      end
    end.inject(&:+)
  end

  # contact page
  def img_push company
    'col-lg-push-5' if company.sort.odd?
  end

  def div_pull company
    'col-lg-pull-7' if company.sort.odd?
  end

  def job_list jobs, job_link
    if jobs.empty?
      content_tag :h2, '目前無職缺', class: 'text-center'
    else
      jobs.in_groups_of(3).map do |job_group|
        content_tag :div, class: 'row' do
          job_group.compact.map do |job|
            content_tag :div, class: 'col-md-4 my-xs-15 pa-xs-10' do
              content_tag :div, class: 'border pa-xs-10' do
                (content_tag :h3, job["JOB"], class: 'mb-xs-0')+
                (content_tag :h4, job["JOB_ADDR_NO_DESCRIPT"], class: 'mt-xs-5 mb-xs-15')+
                (content_tag :p, job["DESCRIPTION"].gsub("\n", "<br>").html_safe)+
                (link_to '加入我們', job_link+job["J"], target: '_blank', class: 'btn btn-md btn-default')
              end
            end
          end.inject(&:+)
        end
      end.inject(&:+)
    end  
  end

end

# <% @jobs.in_groups_of(3).each do |job_group| %>
# <div class="row">
#   <% job_group.compact.each do |job| %>
#   <div class="col-md-4 my-xs-15 pa-xs-10">
#     <div class="border pa-xs-10">
#       <h3 class="mb-xs-0"><%= job["JOB"] %></h3>
#       <h4 class="mt-xs-5 mb-xs-15"><%= job["JOB_ADDR_NO_DESCRIPT"] %></h4>
#       <p><%= job["DESCRIPTION"].gsub("\n", "<br>").html_safe %></p>
#       <%= link_to "加入我們", "#{@job_link+job["J"]}", target: '_blank', class: 'btn btn-md btn-default' %>
#     </div>
#   </div>
#   <% end %>
# </div>
# <% end %>