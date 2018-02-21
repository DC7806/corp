class Admin::AboutController < AdminController
  before_action :find_about
  require 'yaml'

  def index
    @admin_about_en = @admin_about.slice('en')
    @admin_about_zh = @admin_about.except('en')
  end

  def create
    # load
    # @admin_about = YAML::load_file("#{Rails.root}/config/about.yml")
    
    # write
    data = params[:about]
    data.each do |k1, v1|
      v1.each do |k2, v2|
        @admin_about[k1][k2] = v2
      end
    end
    
    # store
    File.write("#{Rails.root}/config/about.yml", @admin_about.to_yaml)

    redirect_back(fallback_location: request.referrer)
  end

  private
  
  def find_about
    @admin_about = YAML::load_file("#{Rails.root}/config/about.yml")
  end

end