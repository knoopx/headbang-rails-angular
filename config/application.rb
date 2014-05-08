require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module Headbang
  USER_AGENT = "headbang/1.0"
  LAST_FM_KEY = "84324111ccccaa831f917ca14114bd6e"
  STOP_WORDS = %w(the vinyl cd cds cdm dvd lp ep 7inch web)

  class << self
    delegate :synchronize, to: :mutex

    def mutex
      @mutex ||= Mutex.new
    end
  end

  class Application < Rails::Application
    config.secret_token = SecureRandom.hex(128)
    config.action_dispatch.perform_deep_munge = false
    config.autoload_paths << config.root.join("lib")
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :delete, :put, :options], max_age: 0
      end
    end
  end
end
