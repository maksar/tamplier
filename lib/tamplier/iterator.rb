module Tamplier
  class Iterator
    TEMPLATES = %w[yml.sample sample.yml yml.example example.yml]
    def call(root)
      TEMPLATES.each do |template|
        Pathname.glob(File.join(root, "*.#{template}")).each do |sample_file|
          yield(sample_file, sample_file.sub(template, 'yml'))
        end
      end
    end
  end
end