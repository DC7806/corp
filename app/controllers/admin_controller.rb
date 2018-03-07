class AdminController < ApplicationController
  include DeviseAdminLocale
  before_action :authenticate_admin!
  # before_action :set_locale

  # def set_locale
  #     I18n.default_locale
  # end

  # def default_url_options
  #   { locale: I18n.default_locale }
  # end

  def inquiries
    @inquiries = Inquiry.order(created_at: :desc).page(params[:page]).per(10)
  end

end