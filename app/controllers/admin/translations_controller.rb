class Admin::TranslationsController < ApplicationController

  def index
    @indexing = Admin::Translation.where(locale: "zh-TW")
    @admin_translations = Admin::Translation.all      
  end

  def edit
  end

  def update
    admin_translation = Admin::Translation.find_by(id: params[:id])
    admin_translation.update(translation_params)
    redirect_to admin_translations_path
  end

  private
  def translation_params
    params.require(:admin_translation).permit(:locale, :key, :value)
  end

end