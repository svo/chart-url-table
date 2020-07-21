require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
  t.rspec_opts = '--no-drb -r rspec_junit_formatter -f d -f RspecJunitFormatter -o test-results.xml'
end

desc 'Run application'
task :run, [:url] do |_, args|
  system("./bin/chart-url-table #{args[:url]}")
end

task default: %i[rubocop spec]
