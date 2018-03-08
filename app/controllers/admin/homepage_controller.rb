class Admin::HomepageController < AdminController
  before_action :find_home
  require 'yaml'

  def index
  end

  def create
    # load
    # @admin_home = YAML::load_file("#{Rails.root}/config/home.yml")
    
    # write
    data = params[:home].except('images')
    data.each do |k1, v1|
      v1.each do |k2, v2|
        @admin_home[k1][k2] = v2
      end
    end
    
    # store
    File.write("#{Rails.root}/config/home.yml", @admin_home.to_yaml)

    @admin_home.slice('images').values.first.keys.each do |image|
      upload(image)
    end

    redirect_back(fallback_location: request.referrer)
  end

  private
  
  def find_home
    @admin_home = YAML::load_file("#{Rails.root}/config/home.yml")
  end

  # upload background images
  def upload(image)
    if params[:home][:images] && params[:home][:images][image.to_sym] != nil
      uploaded_io = params[:home][:images][image.to_sym]
      images_dir = 'public/images/home'
      File.open(Rails.root.join(images_dir, uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        File.rename(file, "#{images_dir}/#{image}.jpg")
      end
    end
  end
end