class AdminController < ApplicationController
  
  #overwrite default_url_options
  include DeviseAdminLocale

  #before_action :authenticate_admin_user!

  def inquiries
    @inquiries = Inquiry.order(created_at: :desc).page(params[:page]).per(10)
  end

  protected

  def upload dir, image
    if params[dir][:images] && params[dir][:images][image] != nil
      uploaded_io = params[dir][:images][image]
      images_dir = "public/images/#{dir}"
      File.open(Rails.root.join(images_dir, uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        File.rename(file, "#{images_dir}/#{image}.jpg")
      end
    end
  end

end