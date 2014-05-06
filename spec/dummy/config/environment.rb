ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../../Gemfile', __FILE__)

require 'bundler/setup'

require 'rails'

Bundler.require(*Rails.groups)
require 'tamplier'

module Dummy
  class Application < Rails::Application
  end
end

Rails.application.configure do
  config.eager_load = false
  config.root = File.dirname(File.expand_path('../', __FILE__))
end

Rails.application.initialize!
