class PagesController < ApplicationController
  before_action :page_meta, except: :search
  skip_before_action :breadcrumbs_root, only: :homepage

  def homepage
    @carousels = Carousel.order(sort: :asc)
    @home = YAML::load_file("#{Rails.root}/config/home.yml")
    @news = News.last(3)
  end

  def career
    response = Job.new
    @jobs = response.jobs
    @job_link = 'https://www.104.com.tw/104i/redir.cfm?i_from=qjob&t=job&j='
    add_breadcrumb t('frontend.breadcrumbs.career'), :career_path
  end

  def contact
    @companies = Company.order(sort: :asc)
    @offices = Office.order(sort: :asc)
    @inquiry = Inquiry.new
    add_breadcrumb t('frontend.breadcrumbs.contact'), :contact_path
  end

  def faq
    @faqs = Faq.order(created_at: :desc)
    add_breadcrumb t('frontend.breadcrumbs.faq'), :faq_path
  end

  def about
    @about = YAML::load_file("#{Rails.root}/config/about.yml")
    @certificates = Certificate.all
    add_breadcrumb t('frontend.breadcrumbs.about'), :about_path
  end

  def download
    @downloads = Download.order(created_at: :desc)
    add_breadcrumb t('frontend.breadcrumbs.download'), :download_path
  end

  def milestones
    @milestones = Milestone.order(year: :desc)
    add_breadcrumb t('frontend.breadcrumbs.milestones'), :milestones_path
  end

  def search
    if params[:query]
      @products = Product.search(params[:query]).order(created_at: :desc).page(params[:page]).per(9)
      params[:query] = nil
    else
      @products = Product.order(created_at: :desc).page(params[:page]).per(9)  
    end
    @categories = Category.all
    add_breadcrumb t('frontend.breadcrumbs.search'), :search_path
  end

end
