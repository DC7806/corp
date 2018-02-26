class PagesController < ApplicationController
  
  def home
  end

  def contact
    @contacts = YAML::load_file("#{Rails.root}/config/contacts.yml")
    @contacts_hq_zh = @contacts.slice('hq_zh')
    @contacts_hq_en = @contacts.slice('hq_en')
    @contacts_regions = @contacts.except('hq_zh', 'hq_en')
    @inquiry = Inquiry.new
  end

  def faq
    @faqs = Faq.order(created_at: :desc)
    @faq_zh = Faq.lang_query('zh-TW').order(created_at: :desc)
  end

  def about
    @about = YAML::load_file("#{Rails.root}/config/about.yml")
    @about_zh = @about.slice('zh')
    @about_en = @about.slice('en')
  end

end
