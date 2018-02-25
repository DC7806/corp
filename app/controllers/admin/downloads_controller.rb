class Admin::DownloadsController < AdminController

  before_action :find_download, only: [:edit, :update, :destroy]

  def index
    @admin_downloads = Admin::Download.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @admin_download = Admin::Download.new
    @admin_download.build_document
  end

  def create
    @admin_download = Admin::Download.new(download_params)
    if @admin_download.save
      redirect_to admin_downloads_path, notice: '新增成功'
    else
      render :new
      flash[:alert] = '新增失敗'
    end
  end

  def edit
    @admin_download.build_document if @admin_download.document.blank? 
  end

  def update
    if @admin_download.update(download_params)
      redirect_to admin_downloads_path, notice: '更新成功'
    else
      render :edit
      flash[:alert] = '更新失敗' 
    end
  end

  def destroy
    @admin_download.destroy
    redirect_to admin_downloads_path, notice: '刪除成功'
  end

  private

  def find_download
    @admin_download = Admin::Download.find_by(id: params[:id])
  end

  def download_params
    params.require(:admin_download).permit(:lang, :title, document_attributes: [:lang, :src, :_destroy])
  end

end
