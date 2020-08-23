require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NestleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.filter_parameters << :password


    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
 
    # Permitted locales available for the application
    I18n.available_locales = [:es, :en]
    config.i18n.default_locale = :es

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    Raven.configure do |config|
      config.dsn = 'https://770f635040994b249201f02200c87090:1aa05fe838ce4a258402d53ddbd00595@o436015.ingest.sentry.io/5396322'
    end
  end
end
