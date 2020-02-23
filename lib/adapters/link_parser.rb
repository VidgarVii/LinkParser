module LinkParser
  module Adapters
    class HTTPClient
      include Singleton

      attr_accessor :http_client

      def initialize
        @http_client = Faraday
      end

      def get(path)
        http_client.get path
      end
    end
  end
end
