module Tamplier
  class Railtie < Rails::Railtie
    initializer('tamplier.initializer') do
      Validator.new.ensure(Rails.root.join('config'), Rails.env)
    end
  end
end
