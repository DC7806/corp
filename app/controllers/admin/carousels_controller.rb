class Admin::CarouselsController < AdminController
  before_action :find_carousel, only: [:edit, :update, :destroy]
  
  def index
    @admin_carousels = Admin::Carousel.order(:sort).all
  end

  def new
    @admin_carousel = Admin::Carousel.new
    @admin_carousel.build_image
  end

  def create
    @admin_carousel = Admin::Carousel.new(carousel_params)
    if @admin_carousel.save
      redirect_to admin_carousels_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @admin_carousel.update(carousel_params)
      redirect_to admin_carousels_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_carousel.destroy
    redirect_to admin_carousels_path, notice: '刪除成功'
  end

  private

  def find_carousel
    @admin_carousel = Admin::Carousel.find_by(id: params[:id])
  end

  def carousel_params
    params.require(:admin_carousel).permit(:title, :description, :cta,
                                            :title_zh_tw, :description_zh_tw, :title_en, :description_en,
                                             image_attributes: [:id, :src])
  end
end
