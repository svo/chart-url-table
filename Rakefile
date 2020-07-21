require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

desc 'Run application'
task :run, [:url] do |_, args|
  system("./bin/chart-url-table #{args[:url]}")
end

task default: %i[rubocop spec]
