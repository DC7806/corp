class Admin::CertificatesController < AdminController

  before_action :find_certificate, only: [:edit, :update, :destroy]

  def index
    @admin_certificates = Admin::Certificate.order(created_at: :desc)
  end

  def new
    @admin_certificate = Admin::Certificate.new
  end

  def create
    @admin_certificate = Admin::Certificate.new(certificate_params)
    if @admin_certificate.save
      redirect_to admin_certificates_path, notice: "New certificate created"
    else
      flash[:alert] = "Somthing Went Wrong: "
      render :new
    end
  end

  def edit
  end

  def update
    if @admin_certificate.update(certificate_params)
      redirect_to admin_certificates_path, notice: "certificate updated"
    else
      flash[:alert] = "Somthing Went Wrong: "
      render :edit
    end
  end

  def destroy
    @admin_certificate.destroy
    redirect_to admin_certificates_path, notice: "certificate deleted"
  end

  private

  def find_certificate
    @admin_certificate = Admin::Certificate.find_by(id: params[:id])
  end

  def certificate_params
    params.require(:admin_certificate).permit(:name, :image, :name_en, :name_zh_tw)
  end
end
