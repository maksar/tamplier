require 'spec_helper'
require 'tamplier/exceptions/configuration_exception'

describe 'integration test' do
  it 'should not let application start without proper config' do
    expect { require File.expand_path("../dummy/config/environment", __FILE__) }.to raise_error(ConfigurationException)
  end
end