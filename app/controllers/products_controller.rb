class ProductsController < ApplicationController
  
  before_action :find_product, only: :show

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    @category = Category.all
  end

  private

  def find_product
    @product = Product.find_by(permalink: params[:id])
    if @product.blank?
      redirect_to products_path
      flash[:notice] = "Page Not Found"
    end
  end
  
end
