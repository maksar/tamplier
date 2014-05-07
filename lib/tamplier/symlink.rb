module Tamplier
  class Symlink < Iterator
    def call(*)
      super do |sample_file, config_file|
        FileUtils.ln_s(sample_file, config_file)
        puts "Made a symlink from #{sample_file} pointing to #{config_file}."
      end
    end
  end
end