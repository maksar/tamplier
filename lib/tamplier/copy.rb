module Tamplier
  class Copy
    def call(root)
      ProblemIterator.new.call(root) do |sample_file, config_file|
        FileUtils.cp(sample_file, config_file) unless config_file.exist?
        puts "Made a copy of #{sample_file} to #{config_file}."
      end
    end
  end
end
