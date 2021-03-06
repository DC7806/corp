require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Corp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Time Zone
    config.time_zone = 'Taipei'
    # I18n
    config.i18n.available_locales = %i[en zh-TW]
    config.i18n.default_locale = :"zh-TW"
    config.i18n.fallbacks = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('services')
    # delay job
    config.active_job.queue_adapter = :delayed_job

    config.to_prepare do
      Devise::SessionsController.layout 'admin'
      Devise::RegistrationsController.layout 'admin'
      Devise::ConfirmationsController.layout 'admin'
      Devise::UnlocksController.layout 'admin'
      Devise::PasswordsController.layout 'admin'
    end
  end
end
