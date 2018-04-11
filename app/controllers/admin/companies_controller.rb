class Admin::CompaniesController < AdminController
  
  before_action :find_company, only: [:edit, :update, :destroy]
  
  def index
    @admin_companies = Admin::Company.order(sort: :asc)
  end

  def new
    @admin_company = Admin::Company.new
    @admin_company.build_image
  end

  def create
    @admin_company = Admin::Company.new(company_params)
    if @admin_company.save
      redirect_to admin_companies_path, notice: '新增成功'
    else
      flash[:alert] = '新增失敗'
      @admin_company.build_image if @admin_company.image.nil?
      render :new
    end
  end

  def edit
    
  end

  def update
    if @admin_company.update(company_params)
      redirect_to admin_companies_path, notice: '更新成功'
    else
      flash[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @admin_company.destroy
    redirect_to admin_companies_path, notice: '刪除成功'
  end

  private

  def find_company
    @admin_company = Admin::Company.find_by(id: params[:id])
  end

  def company_params
    params.require(:admin_company).permit(:title, :address, :number, :fax, :email, :contact, :sort,
                                          :title_zh_tw, :address_zh_tw, :number_zh_tw, :fax_zh_tw, :email_zh_tw, :contact_zh_tw,
                                          :title_en, :address_en, :number_en, :fax_en, :email_en, :contact_en,
                                          image_attributes: [:id, :src, :alt])
  end

end