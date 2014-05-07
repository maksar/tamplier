module Tamplier
  class Validator
    def ensure(root, environment = nil)
      Pathname.glob(File.join(root, '*.yml.sample')).each do |sample_file|
        config_file = sample_file.sub_ext('')
        raise ConfigurationException.new("Configuration file #{config_file} does not exist, but sample file #{sample_file} does.") unless config_file.exist?

        if environmental_file?(sample_file)
          raise ConfigurationException.new("There is no #{environment} environment in the #{config_file} file.") unless YAML.load(config_file.read)[environment].present?
        end

        sample_config = YAML.load(sample_file.read)
        real_config   = YAML.load(config_file.read)

        diff = environmental_file?(sample_file) ?
          flat_keys(sample_config['development']) - flat_keys(real_config[environment]) :
          flat_keys(sample_config)                - flat_keys(real_config)

        raise ConfigurationException.new("Several keys #{diff.inspect} from #{sample_file} are not in #{config_file} file.") unless diff.empty?
      end
    end

    private

    def environmental_file?(file)
      (YAML.load(file.read).keys & %w[development test]).present?
    end

    def flat_keys(hash, path = '')
      return [path] unless hash.is_a?(Hash)
      hash.map do |key, value|
        flat_keys(value, path.blank? ? key : [path, key].join('/'))
      end.flatten
    end
  end
end
