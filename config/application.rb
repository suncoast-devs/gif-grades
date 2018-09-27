require_relative 'boot'

require "rails"
require "active_job/railtie"
require "active_model/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module GifGrades
  class Application < Rails::Application
    config.load_defaults 5.2
  end
end
