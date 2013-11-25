require 'faraday_middleware'

module Rubykhan
  module Connection
    private

    def connection
      Faraday.new(:url => 'http://www.khanacademy.org/api/v1/') do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::Rashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end