# frozen_string_literal: true

require 'singleton'

module LinkParser
  class Application
    include Singleton

    attr_reader :request

    def call(env)
      @request = Rack::Request.new(env)
      params_write_to_env

      if request_valid?
        site_controller = SitesController.new(request)
        site_controller.create
        site_controller.make_response
      else
        page_not_found
      end
    end

    private

    def params_write_to_env
      request.env['link_parser.params'] = request.params
    end

    def request_valid?
      request.post? && request.path == '/site' && request.params['links'].is_a?(Array)
    end

    def page_not_found
      [404, { 'Content-Type' => 'text/plain' }, ["Page Not Found"]]
    end
  end
end
