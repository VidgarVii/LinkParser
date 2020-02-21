# frozen_string_literal: true

require_relative 'link_parser/application'

module LinkParser
  class << self
    def application
      Application.instance
    end

    def root
      Pathname.new(File.expand_path('..', __dir__))
    end

    def env
      ENV.fetch('RACK_ENV', 'development')
    end
  end
end
