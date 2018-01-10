class Admin::NewsController < ApplicationController
  before_action :find_news, only: [:edit, :update, :destroy]

  def index
    @admin_news = Admin::News.order(created_at: :desc)
  end

  def new
    @admin_news = Admin::News.new
  end

  def create
    @admin_news = Admin::News.new(news_params)
    if @admin_news.save
      redirect_to admin_news_index_path, notice: "New news created"
    else
      flash[:alert] = "Somthing Went Wrong: "
      render :new
    end
  end

  def edit
  end

  def update
    if @admin_news.update(news_params)
      redirect_to admin_news_index_path, notice: "News updated"
    else
      flash[:alert] = "Somthing Went Wrong: "
      render :edit
    end
  end

  def destroy
    @admin_news.destroy
    redirect_to admin_news_index_path, notice: "News deleted"
  end

  private

  def find_news
    @admin_news = Admin::News.find_by(id: params[:id])
  end

  def news_params
    params.require(:admin_news).permit(:title, :content, :permalink, :title_en, :content_en, :"title_zh_tw", :"content_zh_tw")
  end

end
