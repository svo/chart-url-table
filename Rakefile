require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

desc 'Run application'
task :run do
  system('./bin/chart-url-table')
end

task default: %i[rubocop spec]
