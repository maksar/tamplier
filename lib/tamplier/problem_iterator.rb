module Tamplier
  class ProblemIterator
    def call(root)
      Iterator.new.call(root) do |sample_file, config_file|
        if config_file.exist? || config_file.symlink?
          puts "#{config_file} already exist, skipping."
        else
          yield(sample_file, config_file)
        end
      end
    end
  end
end