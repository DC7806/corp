class Admin::AchievementsController < AdminController
  before_action :find_achievement, only: [:edit, :update, :destroy]
  
  def index
    @admin_achievements = Admin::Achievement.order(:sort).all
  end

  def new
    @admin_achievement = Admin::Achievement.new
    @admin_achievement.build_image
  end

  def create
    @admin_achievement = Admin::Achievement.new(achievement_params)
    if @admin_achievement.save
      redirect_to admin_achievements_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      @admin_achievement.build_image if @admin_achievement.image.nil?
      render :new
    end
  end

  def edit
    @admin_achievement.build_image if @admin_achievement.image.nil?
  end

  def update
    if @admin_achievement.update(achievement_params)
      redirect_to admin_achievements_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_achievement.destroy
    redirect_to admin_achievements_path, notice: '刪除成功'
  end

  private

  def find_achievement
    @admin_achievement = Admin::Achievement.find_by(id: params[:id])
  end

  def achievement_params
    params.require(:admin_achievement).permit(:title, :description, :permalink,
                                              :title_zh_tw, :description_zh_tw, :title_en, :description_en,
                                              image_attributes: [:id, :src, :alt])
  end

end