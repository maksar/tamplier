require 'spec_helper'
require 'tamplier/exceptions/configuration_exception'
require 'tamplier/validator'

describe Tamplier::Validator do
  it 'checks, that all required config files are present' do
    expect { subject.ensure('spec/examples/absent_file/') }.to raise_error(ConfigurationException, %q[Configuration file spec/examples/absent_file/invalid.yml does not exist, but sample file spec/examples/absent_file/invalid.yml.sample does.])
  end

  it 'checks, that there is a valid environment in yml file' do
    expect { subject.ensure('spec/examples/absent_environment/', 'production') }.to raise_error(ConfigurationException, %q[There is no production environment in the spec/examples/absent_environment/environment.yml file.])
  end

  it 'checks, that all environmental keys from sample file exist in real file' do
    expect { subject.ensure('spec/examples/absent_environment_key/', 'production') }.to raise_error(ConfigurationException, %q[Several keys ["not_exist"] from spec/examples/absent_environment_key/environment.yml.sample are not in spec/examples/absent_environment_key/environment.yml file.])
  end

  it 'checks, that all environmental keys (in deep) from sample file exist in real file' do
    expect { subject.ensure('spec/examples/absent_environment_keys/', 'production') }.to raise_error(ConfigurationException, %q[Several keys ["first/second/fourth"] from spec/examples/absent_environment_keys/environment.yml.sample are not in spec/examples/absent_environment_keys/environment.yml file.])
  end

  it 'checks, that all non enviromental keys from sample file exist in real file' do
    expect { subject.ensure('spec/examples/absent_keys/') }.to raise_error(ConfigurationException, %q[Several keys ["first/second/third", "first/second/fourth"] from spec/examples/absent_keys/non_environment.yml.sample are not in spec/examples/absent_keys/non_environment.yml file.])
  end
end