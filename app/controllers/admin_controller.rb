class AdminController < ApplicationController
  before_action :authenticate_admin!, :set_locale, :default_url_options
  before_action :configure_permitted_parameters, if: :devise_controller?


  def set_locale
      I18n.default_locale
  end

  def default_url_options
    { locale: I18n.default_locale }
  end

  def inquiries
    @inquiries = Inquiry.order(created_at: :desc).page(params[:page]).per(10)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end