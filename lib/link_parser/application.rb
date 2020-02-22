# frozen_string_literal: true

require 'singleton'

module LinkParser
  class Application
    include Singleton

    def call(env)
      [
          200,
          {'Content_Type' => 'text/plain'},
          ['Hello World']
      ]
    end

    def bootstrap!
      setup_database
      require_app
      require_routes
    end

    def routes

    end

    private

    def setup_database

    end

    def require_app

    end

    def require_routes

    end
  end
end
