module LinkParser
  class AbstractController
    attr_reader :params, :response, :request

    CONTENT_TYPE = {json: { type: 'application/json', method: :to_json }}

    def initialize(request)
      raise InvalidParams, "Request must be object Rack::Request, not a #{request.class}" unless request.is_a?(Rack::Request)

      @request  = request
      @params   = request.params
      @response = Rack::Response.new
    end

    def make_response
      response.finish
    end

    def render(context_type, content)
      raise InvalidParams, "Undefine content type for #{context_type}" unless CONTENT_TYPE.has_key?(context_type)

      response.set_header('Content-Type', CONTENT_TYPE[context_type][:type])
      response.write(content.send CONTENT_TYPE[context_type][:method])
    end
  end

  InvalidParams = Class.new(StandardError)
end
