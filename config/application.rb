require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Beliyuk
  class Application < Rails::Application
    config.autoload_paths << config.root.join('lib')
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    #use rails scaffolding generator
    config.app_generators.scaffold_controller = :scaffold_controller
    config.active_job.queue_adapter = :sidekiq
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

  end
end
