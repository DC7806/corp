class ProductsController < ApplicationController
  
  before_action :find_product, only: :show
  before_action :find_categories

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
  end

  private

  def find_product
    @product = Product.find_by(permalink: params[:id])
    if @product.blank?
      redirect_to products_path
      flash[:notice] = "Page Not Found"
    end
  end
  
  def find_categories
    @categories = Category.all
  end

end
