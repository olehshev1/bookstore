require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookstore
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # supports :s3, :s3_multipart, or :app
    config.upload_server = if ENV['UPLOAD_SERVER'].present?
                             ENV['UPLOAD_SERVER'].to_sym
                           elsif Rails.env.production?
                             :s3
                           else
                             :app
                           end
  end
end
