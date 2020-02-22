module ControllerHelpers
  def response
    @controller ? @controller.response : Rack::Response
  end

  def request
    @controller ? @controller.request : []
  end

  def mock_env
    {"CONTENT_LENGTH"=>"1", "CONTENT_TYPE"=>"*/*; charset=UTF-8", "GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/site", "rack.input"=> '', "QUERY_STRING"=>"", "REMOTE_ADDR"=>"127.0.0.1", "REMOTE_HOST"=>"127.0.0.1", "REQUEST_METHOD"=>"GET", "REQUEST_URI"=>"http://localhost:9292", "SCRIPT_NAME"=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"9292", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWARE"=>"WEBrick/1.5.0 (Ruby/2.7.0/2019-11-23)", "HTTP_ACCEPT"=>"*/*", "HTTP_CACHE_CONTROL"=>"no-cache", "HTTP_HOST"=>"localhost:9292", "HTTP_CONNECTION"=>"Keep-Alive", "HTTP_USER_AGENT"=>"Apache-HttpClient/4.5.10 (Java/11.0.5)", "HTTP_ACCEPT_ENCODING"=>"gzip,deflate", "rack.version"=>[1, 3], "rack.multithread"=>true, "rack.multiprocess"=>false, "rack.run_once"=>false, "rack.url_scheme"=>"http", "rack.hijack?"=>true, "rack.hijack_io"=>nil, "HTTP_VERSION"=>"HTTP/1.1", "REQUEST_PATH"=>"/site", "rack.tempfiles"=>[]}
  end

  def post(action, **params)
    request = Rack::Request.new(mock_env)
    request.env['REQUEST_METHOD'] = 'POST'
    request.params.merge!(params)

    @controller = subject.new(request)
    @controller.send action
  end
end
