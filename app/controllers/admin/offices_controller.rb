class Admin::OfficesController < AdminController

before_action :find_office, only: [:edit, :update, :destroy]
  
  def index
    @admin_offices = Admin::Office.order(sort: :asc)
  end

  def new
    @admin_office = Admin::Office.new
  end

  def create
    @admin_office = Admin::Office.new(office_params)
    if @admin_office.save
      redirect_to admin_offices_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @admin_office.update(office_params)
      redirect_to admin_offices_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_office.destroy
    redirect_to admin_offices_path, notice: '刪除成功'
  end

  private

  def find_office
    @admin_office = Admin::Office.find_by(id: params[:id])
  end

  def office_params
    params.require(:admin_office).permit(:title, :address, :number, :fax, :email, :contact, :sort,
                                          :title_zh_tw, :address_zh_tw, :number_zh_tw, :fax_zh_tw, :email_zh_tw, :contact_zh_tw,
                                          :title_en, :address_en, :number_en, :fax_en, :email_en, :contact_en)
  end

end
