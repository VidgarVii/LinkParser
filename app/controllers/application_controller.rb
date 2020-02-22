module LinkParser
  class ApplicationController
    attr_reader :params, :response

    def initialize(request)
      raise InvalidParams, "Request must be object Rack::Request, not a #{request.class}" unless request.is_a?(Rack::Request)

      @params   = request.params
      @response = Rack::Response.new
    end

    def make_response
      response.finish
    end
  end

  InvalidParams = Class.new(StandardError)
end
