class Admin::MilestonesController < AdminController
  
  before_action :find_milestone, only: [:edit, :update, :destroy]
  
  def index
    @admin_milestones = Admin::Milestone.order(year: :desc)
  end
  
  def new
    @admin_milestone = Admin::Milestone.new
  end
  
  def create
    @admin_milestone = Admin::Milestone.new(milestone_params)
    if @admin_milestone.save
      redirect_to admin_milestones_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @admin_milestone.update(milestone_params)
      redirect_to admin_milestones_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end
  
  def destroy
    @admin_milestone.destroy
    redirect_to admin_milestones_path, notice: '刪除成功'
  end

  private

  def find_milestone
    @admin_milestone = Admin::Milestone.find_by(id: params[:id])
  end
  
  def milestone_params
    params.require(:admin_milestone).permit(:lang, :year, :content)
  end
  
end