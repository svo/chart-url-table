require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc "Run application"
task :run do
  system('./bin/chart-url-table')
end

task :default => :spec
