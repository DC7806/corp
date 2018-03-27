class Admin::SystemController < AdminController

  before_action :find_system
  require 'yaml'

  def index
    @admin_system_site_name = @admin_system.slice('site_name')
    @admin_system_tracking = @admin_system.slice('tracking')
    @admin_system_images = @admin_system.slice('images')
    @admin_system_cache = @admin_system.slice('others')
  end

  def create
    # write
    data = params[:system].except('images')
    data.each do |k1, v1|
      v1.each do |k2, v2|
        @admin_system[k1][k2] = v2
      end
    end
    # store
    File.write("#{Rails.root}/config/system.yml", @admin_system.to_yaml)
    @admin_system.fetch('images').keys.each do |locale|
      upload(:system, locale)
    end
    redirect_back(fallback_location: request.referrer)
  end

  private
  
  def find_system
    @admin_system = YAML::load_file("#{Rails.root}/config/system.yml")
  end

end