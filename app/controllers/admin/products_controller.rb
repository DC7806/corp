class Admin::ProductsController < AdminController
  
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @admin_products = Admin::Product.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @admin_product = Admin::Product.new
    @admin_product.images.build
    @admin_product.build_metum
  end

  def create
    @admin_product = Admin::Product.new(product_params)
    if @admin_product.save
      redirect_to admin_products_path, notice: "New product created"
    else
      flash[:alert] = "Somthing Went Wrong: "
      render :new
    end
  end

  def edit
  end

  def update
    if @admin_product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated"
    else
      flash[:alert] = "Somthing Went Wrong: "
      render :edit
    end
  end

  def destroy
    @admin_product.destroy
    redirect_to admin_products_path, notice: "Product deleted"
  end

  private

  def find_product
    @admin_product = Admin::Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:admin_product).permit(:name, :model, :country, :document, :inquiry, :permalink, :feature, :specification, :dimensions, :description,
                                          :name_en, :feature_en, :specification_en, :dimensions_en, :description_en,
                                          :name_zh_tw, :feature_zh_tw, :specification_zh_tw, :dimensions_zh_tw, :description_zh_tw,
                                          {category_ids: []}, 
                                          {certificate_ids: []}, 
                                          {images_attributes: [:id, :lang, :src, :alt, :_destroy]},
                                          {metum_attributes: [:title, :meta_description, :og_title, :og_description, :og_image,
                                                              :title_en, :meta_description_en, :og_title_en, :og_description_en,
                                                              :title_zh_tw, :meta_description_zh_tw, :og_title_zh_tw, :og_description_zh_tw]})
  end
end