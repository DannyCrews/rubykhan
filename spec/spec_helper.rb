require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'rubykhan'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => 'coveralls.io')

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, 'http://www.khanacademy.org/api/v1/' + path)
end

def stub_get(path)
  stub_request(:get, 'http://www.khanacademy.org/api/v1/' + path)
require 'json'
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end