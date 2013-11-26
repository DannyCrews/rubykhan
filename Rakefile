require 'bundler'
Bundler::GemHelper.install_tasks

# Pulls in equiv of 'rspec spec' to be 'rake spec'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# If you just run 'rake', it will run 'rake spec'
task test: :spec
task default: :spec

require 'yard'
namespace :doc do
  YARD::Rake::YardocTask.new do |task|
    task.files   = ['lib/**/*.rb']
    task.options = ['--markup', 'markdown']
  end
end


