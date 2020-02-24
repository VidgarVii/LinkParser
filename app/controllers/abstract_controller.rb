# frozen_string_literal: true

module LinkParser
  class AbstractController
    attr_reader :params, :response, :request

    CONTENT_TYPE = { json: { type: 'application/json', method: :to_json } }

    def initialize(request)
      unless request.is_a?(Rack::Request)
        raise InvalidParams, "#{locale['errors']['raise']['no_rack_request']} #{request.class}"
      end

      @request  = request
      @params   = request.params
      @response = Rack::Response.new
    end

    def make_response
      response.finish
    end

    def render(context_type, content)
      unless CONTENT_TYPE.key?(context_type)
        raise InvalidParams, "#{locale['errors']['raise']['content_type']} #{context_type}"
      end

      request.env['link_parser.controller'] = self.class
      response.set_header('Content-Type', CONTENT_TYPE[context_type][:type])
      response.write(content.send(CONTENT_TYPE[context_type][:method]))
    end
  end

  InvalidParams = Class.new(StandardError)
end
