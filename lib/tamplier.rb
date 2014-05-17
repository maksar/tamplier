require 'pathname'
require 'yaml'
require 'active_support/all'

require_relative 'tamplier/version'
require_relative 'tamplier/exceptions/configuration_exception'
require_relative 'tamplier/iterator'
require_relative 'tamplier/validator'

require 'tamplier/railtie' if defined?(Rails)