module Tamplier
  class Iterator
    def call(root)
      Pathname.glob(File.join(root, '*.yml.sample')).each do |sample_file|
        config_file = sample_file.sub_ext('')

        if config_file.exist? || config_file.symlink?
          puts "#{config_file} already exist, skipping."
        else
          yield(sample_file, config_file)
        end
      end
    end
  end
end