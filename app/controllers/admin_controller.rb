class AdminController < ApplicationController
  def set_locale
      I18n.default_locale
  end
end