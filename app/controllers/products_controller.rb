class ProductsController < ApplicationController
  
  before_action :page_meta, only: :index
  before_action :find_product, only: :show
  before_action :find_categories
  
  def index
    @products = Product.where(public: true).order(created_at: :desc).page(params[:page]).per(9)
    add_breadcrumb t('frontend.breadcrumbs.products'), :products_path
  end

  def show 
    add_breadcrumb t('frontend.breadcrumbs.products'), :products_path
    add_breadcrumb @product.name, product_path(@product.permalink)
    page_meta @product      
  end

  private

  def find_product
    @product = Product.find_by(permalink: params[:id])
    if @product.blank?
      redirect_to products_path
      flash[:alert] = t('frontend.alert.page_not_found')
    end
  end
  
  def find_categories
    @categories = Category.includes(:products)
  end

end
