class PagesController < ApplicationController
  
  def home
  end

  def contact
    @contacts = YAML::load_file("#{Rails.root}/config/contacts.yml")
    @contacts_regions = @contacts.except('hq_zh', 'hq_en')
    @inquiry = Inquiry.new
  end

  def faq
    @faqs = Faq.order(created_at: :desc)
  end

  def about
    @about = YAML::load_file("#{Rails.root}/config/about.yml")
  end

  def download
    @downloads = Download.order(created_at: :desc)
  end

end
