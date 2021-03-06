class Admin::FaqsController < AdminController
  before_action :find_faq, only: [:edit, :update, :destroy]

  def index
    @admin_faqs = Admin::Faq.order(created_at: :desc)
  end

  def new
    @admin_faq = Admin::Faq.new
  end 

  def create
    @admin_faq = Admin::Faq.new(faq_params)
    if @admin_faq.save
      redirect_to admin_faqs_path, notice: '新增成功'
    else
      render :new
      flash[:alert] = '新增失敗'
    end
  end

  def edit
  end

  def update
    if @admin_faq.update(faq_params)
      redirect_to admin_faqs_path, notice: '更新成功'
    else
      render :edit
      flash[:alert] = '更新失敗'
    end
  end

  def destroy
    @admin_faq.destroy
    redirect_to admin_faqs_path, notice: '刪除成功'
  end

  private
  
  def find_faq
    @admin_faq = Admin::Faq.find_by(id: params[:id])
  end
  
  def faq_params
    params.require(:admin_faq).permit(:lang, :question, :answer, :sort)
  end

end