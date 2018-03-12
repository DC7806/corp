class CategoriesController < ApplicationController

  before_action :find_category, only: :show
  before_action :find_products

  def index
    @categories = Category.order(created_at: :desc)
    add_breadcrumb t('frontend.breadcrumbs.categories'), :categories_path  
  end

  def show
    @categories = Category.order(created_at: :desc)
    add_breadcrumb t('frontend.breadcrumbs.categories'), :categories_path
    add_breadcrumb @category.name, category_path(@category.permalink)
  end

  private

  def find_category
    @category = Category.find_by(permalink: params[:id])
    if @category.blank?
      redirect_to categories_path
      flash[:notice] = "Page Not Found"
    end
  end

  def find_products
    @products = Product.all
  end

end
