class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  before_action :set_locale, :default_url_options, :site_settings
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_locale
    if params[:locale]
      I18n.locale = normalize_locale(params[:locale])
    elsif params[:locale].blank?
      I18n.locale = extract_locale_from_accept_language_header
    # else
    #   I18n.default_locale
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
 
  def extract_locale_from_accept_language_header
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    when 'zh'
      :"zh-TW"
    else
      :en
    end
  end

  def normalize_locale(locale)
    case locale
    when 'zh-TW'
      :"zh-TW"
    else
      :en
    end
  end

  def site_settings
    system_settings = YAML::load_file("#{Rails.root}/config/system.yml")
    case I18n.locale
    when :'zh-TW'
      @site_name = system_settings['site_name']['zh']
    when :en
      @site_name = system_settings['site_name']['en']
    end
    @nav_categories = Category.all
    @footer_site_name = system_settings['site_name']['en'].upcase
    @fb_id = system_settings['tracking']['FB_id']
  end
  
  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
  end

end
