require 'bundler/gem_tasks'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec)
task :default do
  FileUtils.rm_rf('coverage')
  Rake::Task['rspec'].invoke
end
