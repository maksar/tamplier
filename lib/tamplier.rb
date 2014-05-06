require 'pathname'
require 'yaml'
require 'active_support/all'

require 'tamplier/version'
require 'tamplier/exceptions/configuration_exception'
require 'tamplier/validator'

require 'tamplier/railtie' if defined?(Rails)