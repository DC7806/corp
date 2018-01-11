class CategoriesController < ApplicationController

  before_action :find_category, only: :show

  def index
    @categories = Category.order(created_at: :desc)
  end

  def show
  end

  private

  def find_category
    @category = Category.find_by(permalink: params[:id])
    if @category.blank?
      redirect_to categories_path
      flash[:notice] = "Page Not Found"
    end
  end

end
