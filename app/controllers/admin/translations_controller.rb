class Admin::TranslationsController < AdminController

  def index
    if params[:query]
      @labels = Admin::Translation.search(params[:query]).map(&:key).uniq
      # @labels = Admin::Translation.search(params[:query]).map {|e| e.key}.uniq
      @admin_translations = Admin::Translation.search(params[:query])
      params[:query] = nil
    else
      @labels = Admin::Translation.all.map(&:key).uniq
      @admin_translations = Admin::Translation.order(key: :asc)
    end
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