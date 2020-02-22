# frozen_string_literal: true

require 'singleton'

module LinkParser
  class Application
    include Singleton

    def call(env)
      request  = Rack::Request.new(env)

      #
      if request.post? && request.path == '/site'
        site_controller = SitesController.new(request)
        site_controller.make_response
      else
        page_not_found
      end
    end

    private

    def page_not_found
      [404, { 'Content-Type' => 'text/plain' }, ["Page Not Found"]]
    end
  end
end
