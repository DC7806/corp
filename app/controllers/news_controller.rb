class NewsController < ApplicationController

  before_action :find_news, only: :show

  def index
    @news = News.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
  end

  private

  def find_news
    @news = News.find_by(permalink: params[:id])
    if @news.blank?
      redirect_to news_index_path
      flash[:notice] = "Page Not Found"
    end
  end

end
