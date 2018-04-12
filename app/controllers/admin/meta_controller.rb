class Admin::MetaController < AdminController
  
  before_action :find_metum, only:[:edit, :update]
  
  def index
    @admin_meta = []
    ['achievements','homepage','products','categories','news','contact','faq','about','download','milestones'].each do |name|
      @admin_meta << Metum.where(page_name: name).first
    end
  end

  def edit
  end

  def update
    if @admin_metum.update(metum_params)
      redirect_to admin_meta_path, notice: '更新成功'
    else
      render :edit
    end
  end

  private

  def find_metum
    @admin_metum = Admin::Metum.find_by(id: params[:id])
  end

  def metum_params
    params.require(:admin_metum).permit(:page_name, :og_title, :og_description, :og_image, :metable_type, :metable_id,
                                        :title_zh_tw, :meta_description_zh_tw, :og_title_zh_tw, :og_description_zh_tw, 
                                        :title_en, :meta_description_en, :og_title_en, :og_description_en)
  end

end