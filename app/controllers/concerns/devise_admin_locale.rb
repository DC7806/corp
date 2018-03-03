module DeviseAdminLocale
  extend ActiveSupport::Concern
  included do
    before_action :set_locale, :default_url_options

    def set_locale
        I18n.locale = :'zh-TW'
    end

    def default_url_options
      { locale: 'zh-TW' }
    end
    
  end
end