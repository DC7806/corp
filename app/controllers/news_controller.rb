class NewsController < ApplicationController
  before_action :page_meta, only: :index
  before_action :find_news, only: :show

  def index
    @news = News.order(created_at: :desc).page(params[:page]).per(5)
    add_breadcrumb t('frontend.breadcrumbs.news_index'), :news_index_path
  end

  def show
    add_breadcrumb t('frontend.breadcrumbs.news_index'), :news_index_path
    add_breadcrumb @news.title, news_path(@news.permalink)
    page_meta @news
  end

  private

  def find_news
    @news = News.find_by(permalink: params[:id])
    if @news.blank?
      redirect_to news_index_path
      flash[:alert] = t('frontend.alert.page_not_found')
    end
  end

end
