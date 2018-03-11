class PagesController < ApplicationController
  
  def homepage
    @home = YAML::load_file("#{Rails.root}/config/home.yml")
    @news = News.last(3)
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
    @certificates = Certificate.all
  end

  def download
    @downloads = Download.order(created_at: :desc)
  end

  def milestone
    @milestones = Milestone.order(created_at: :desc)
  end

  def search
    if params[:query]
      byebug
      @products = Product.search(params[:query]).order(created_at: :desc).page(params[:page]).per(9)
      @categories = Category.all
    else
      @products = Product.order(created_at: :desc).page(params[:page]).per(9)
      @categories = Category.all  
    end
  end

end
