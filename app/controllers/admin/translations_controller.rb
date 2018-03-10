class Admin::TranslationsController < AdminController

  def index
    @admin_translations = Admin::Translation.order(key: :asc)
    @indexing = Admin::Translation.where(locale: "zh-TW")
  end

  def update_all
    params['admin_translation'].each do |id|
      admin_translation = Admin::Translation.find(id.to_i)
      admin_translation.update(translation_params(id))
    end
    redirect_back(fallback_location: request.referrer)
  end

  private
  def translation_params(id)
    params.require(:admin_translation).fetch(id).permit(:locale, :key, :value)
  end

end