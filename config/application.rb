require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'carrierwave'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Itinarite
  class Application < Rails::Application
    config.assets.enabled = true
    Dir.glob("#{Rails.root}/app/assets/global/**/*/").each do |path|
      config.assets.paths << path
    end
     Dir.glob("#{Rails.root}/app/assets/pages/**/*/").each do |path|
      config.assets.paths << path
    end
     Dir.glob("#{Rails.root}/app/assets/themes/**/*/").each do |path|
      config.assets.paths << path
    end
     Dir.glob("#{Rails.root}/app/assets/js/**/*/").each do |path|
      config.assets.paths << path
    end

    Dir.glob("#{Rails.root}/app/assets/css/**/*/").each do |path|
      config.assets.paths << path
    end
    Dir.glob("#{Rails.root}/app/assets/fonts/**/*/").each do |path|
      config.assets.paths << path
    end
    Dir.glob("#{Rails.root}/app/assets/flag/**/*/").each do |path|
      config.assets.paths << path
    end

    Dir.glob("#{Rails.root}/app/assets/fancybox/**/*/").each do |path|
      config.assets.paths << path
    end
    Dir.glob("#{Rails.root}/app/assets/bootstrap-fileupload/**/*/").each do |path|
      config.assets.paths << path
    end
    Dir.glob("#{Rails.root}/app/assets/bootstrap-datetimepicker/**/*/").each do |path|
      config.assets.paths << path
    end

    Dir.glob("#{Rails.root}/app/assets/bootstrap-daterangepicker/**/*/").each do |path|
      config.assets.paths << path
    end
    Dir.glob("#{Rails.root}/app/assets/bootstrap-datepicker/**/*/").each do |path|
      config.assets.paths << path
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.initialize_on_precompile = false
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
