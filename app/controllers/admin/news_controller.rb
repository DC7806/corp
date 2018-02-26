class Admin::NewsController < AdminController
    
  before_action :find_news, only: [:edit, :update, :destroy]

  def index
    @admin_news = Admin::News.order(created_at: :desc)
  end

  def new
    @admin_news = Admin::News.new
    @admin_news.build_image
    @admin_news.build_metum
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
    params.require(:admin_news).permit(:title, :content, :permalink, :title_en, :content_en, :title_zh_tw, :content_zh_tw,
                                        image_attributes: [:id, :lang, :src, :alt, :_destroy],
                                        metum_attributes: [
                                                            :id, :title, :meta_description, :og_title, :og_description, :og_image,
                                                            :title_en, :meta_description_en, :og_title_en, :og_description_en,
                                                            :title_zh_tw, :meta_description_zh_tw, :og_title_zh_tw, :og_description_zh_tw,
                                                            :_destroy
                                                          ])
  end

end
