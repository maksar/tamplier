require 'pathname'
require 'yaml'

require 'tamplier/version'
require 'tamplier/exceptions/configuration_exception'
require 'tamplier/validator'

require 'tamplier/railtie' if defined?(Rails)