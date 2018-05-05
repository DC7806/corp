class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :set_locale, :default_url_options, :site_settings, :breadcrumbs_root
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
      @site_name = system_settings['site_name']['zh-TW']
      @logo = system_settings['images']['logo_zh-TW']
    when :en
      @site_name = system_settings['site_name']['en']
      @logo = system_settings['images']['logo_en']
    end
    @favicon = system_settings['images']['favicon']
    @nav_categories = Category.all
    @footer_site_name = system_settings['site_name']['en'].upcase
    @fb_id = system_settings['tracking']['FB_id']
    @ga_id = system_settings['tracking']['GA_id']
    @gtm_id = system_settings['tracking']['GTM_id']
    @image_cache = system_settings['others']['image_cache']
  end

  def breadcrumbs_root
    add_breadcrumb t('frontend.breadcrumbs.home'), :root_path
  end
  
  protected
  
  # devise
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  # seo
  def page_meta page = nil
    if action_name == 'show'
      @title = page.metum.title
      @meta_desc = page.metum.meta_description
      @og = { site_name:   @site_name,
              type:        page.class.name.downcase,
              title:       page.metum.title,
              url:         request.url,
              description: page.metum.meta_description,
              image:       (root_url + page.metum.og_image.url if page.metum.og_image.url.present?)}
    elsif action_name == 'index'
      @title = Metum.find_page(controller_name).title
      @meta_desc = Metum.find_page(controller_name).meta_description
      @og = { site_name:   @site_name,
              type:        controller_name,
              title:       Metum.find_page(controller_name).og_title,
              url:         request.url,
              description: Metum.find_page(controller_name).og_description,
              image:       (root_url + Metum.find_page(controller_name).og_image.url if Metum.find_page(controller_name).og_image.url.present?)}              
    elsif controller_name == 'pages'
      @title = Metum.find_page(action_name).title
      @meta_desc = Metum.find_page(action_name).meta_description
      @og = { site_name:   @site_name,
              type:        action_name,
              title:       Metum.find_page(action_name).og_title,
              url:         request.url,
              description: Metum.find_page(action_name).og_description,
              image:       (root_url+Metum.find_page(action_name).og_image.url if Metum.find_page(action_name).og_image.url.present?)}
    end
  end

end