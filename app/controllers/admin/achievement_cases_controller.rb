class Admin::AchievementCasesController < AdminController

  before_action :find_achievement_case, only: [:edit, :update, :destroy, :highlight]
  
  def index
    @admin_achievement_cases = Admin::AchievementCase.order(:sort).all
  end

  def new
    @admin_achievement_case = Admin::AchievementCase.new
    @admin_achievement_case.build_image
  end

  def create
    @admin_achievement_case = Admin::AchievementCase.new(achievement_case_params)
    if @admin_achievement_case.save
      redirect_to admin_achievement_cases_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      @admin_achievement_case.build_image if @admin_achievement_case.image.nil?
      render :new
    end
  end

  def edit
    @admin_achievement_case.build_image if @admin_achievement_case.image.nil?
  end

  def update
    if @admin_achievement_case.update(achievement_case_params)
      redirect_to admin_achievement_cases_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_achievement_case.destroy
    redirect_to admin_achievement_cases_path, notice: '刪除成功'
  end

  def highlight
    @admin_achievement_case.toggle!(:is_highlight)
  end

  private

  def find_achievement_case
    @admin_achievement_case = Admin::AchievementCase.find_by(id: params[:id])
  end

  def achievement_case_params
    params.require(:admin_achievement_case).permit(:title, :description, :achievement_id,
                                                    :title_zh_tw, :description_zh_tw, :title_en, :description_en,
                                                    image_attributes: [:id, :src, :alt])
  end

end