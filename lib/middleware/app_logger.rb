# frozen_string_literal: true

require 'logger'

class AppLogger
  def initialize(app)
    @app    = app
    @logger = Logger.new(LinkParser.root.join('log/app.log'))
  end

  def call(env)
    status, headers, response = @app.call(env)
    @logger.info(make_log(env, status, headers))
    [status, headers, response]
  end

  private

  def make_log(env, status, headers)
    {
        Request:    "#{env['REQUEST_METHOD']} #{env['REQUEST_PATH']}",
        Handler:    "#{env['link_parser.controller'].class}",
        Parameters: env['link_parser.params'],
        Response:   "#{status} [#{headers['Content-Type']}]"
    }
  end
end
