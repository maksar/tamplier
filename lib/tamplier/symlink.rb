module Tamplier
  class Symlink
    def call(root)
      ProblemIterator.new.call(root) do |sample_file, config_file|
        FileUtils.ln_s(sample_file, config_file)
        puts "Made a symlink from #{sample_file} pointing to #{config_file}."
      end
    end
  end
end