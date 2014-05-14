module Tamplier
  class Symlink
    def call(root)
      ProblemIterator.new.call(root) do |sample_file, config_file|
        FileUtils.symlink(sample_file.basename, config_file)
        puts "Made a symlink from #{config_file} pointing to #{sample_file.basename}."
      end
    end
  end
end