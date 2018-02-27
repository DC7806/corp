class Admin::SystemController < AdminController

  before_action :find_system
  require 'yaml'

  def index
    @admin_system_site_name = @admin_system.slice('site_name')
    @admin_system_tracking = @admin_system.slice('tracking')
    @admin_system_logo = @admin_system.slice('logo')
  end

  def create
    # load
    # @admin_system = YAML::load_file("#{Rails.root}/config/system.yml")
    
    # write
    data = params[:system].except('logo')
    data.each do |k1, v1|
      v1.each do |k2, v2|
        @admin_system[k1][k2] = v2
      end
    end
    # store
    File.write("#{Rails.root}/config/system.yml", @admin_system.to_yaml)

    @admin_system.slice('logo').values.first.keys.each do |locale|
      upload(locale)
    end

    redirect_back(fallback_location: request.referrer)
  end

  private
  
  def upload(locale)
    if params[:system][:logo] && params[:system][:logo][locale.to_sym] != nil
      uploaded_io = params[:system][:logo][locale.to_sym]
      logo_dir = 'public/images/system'
      File.open(Rails.root.join(logo_dir, uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        File.rename(file, "#{logo_dir}/logo_#{locale}.jpg")
      end
    end
  end
  
  def find_system
    @admin_system = YAML::load_file("#{Rails.root}/config/system.yml")
  end

end