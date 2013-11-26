require 'bundler'
Bundler::GemHelper.install_tasks

# Pulls in equiv of 'rspec spec' to be 'rake spec'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# If you just run 'rake', it will run 'rake spec'
task test: :spec
task default: :spec
