describe 'ApplicationController' do
  subject { LinkParser::ApplicationController }

  let(:mock_env) {
    {"CONTENT_LENGTH"=>"53", "CONTENT_TYPE"=>"*/*; charset=UTF-8", "GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/site", "rack.input"=> '', "QUERY_STRING"=>"links%5B%5D=https%3A%2F%2Fvk.com%2F&links%5B%5D=https%3A%2F%2Fgithub.com%2F&links%5B%5D=https%3A%2F%2Fmail.ru%2F&links%5B%5D=https%3A%2F%2Fyandex.ru%2F&links%5B%5D=https%3A%2F%2Fruby-doc.org%2F", "REMOTE_ADDR"=>"127.0.0.1", "REMOTE_HOST"=>"127.0.0.1", "REQUEST_METHOD"=>"POST", "REQUEST_URI"=>"http://localhost:9292/site?links%5B%5D=https%3A%2F%2Fvk.com%2F&links%5B%5D=https%3A%2F%2Fgithub.com%2F&links%5B%5D=https%3A%2F%2Fmail.ru%2F&links%5B%5D=https%3A%2F%2Fyandex.ru%2F&links%5B%5D=https%3A%2F%2Fruby-doc.org%2F", "SCRIPT_NAME"=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"9292", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWARE"=>"WEBrick/1.5.0 (Ruby/2.7.0/2019-11-23)", "HTTP_ACCEPT"=>"*/*", "HTTP_CACHE_CONTROL"=>"no-cache", "HTTP_HOST"=>"localhost:9292", "HTTP_CONNECTION"=>"Keep-Alive", "HTTP_USER_AGENT"=>"Apache-HttpClient/4.5.10 (Java/11.0.5)", "HTTP_ACCEPT_ENCODING"=>"gzip,deflate", "rack.version"=>[1, 3], "rack.multithread"=>true, "rack.multiprocess"=>false, "rack.run_once"=>false, "rack.url_scheme"=>"http", "rack.hijack?"=>true, "rack.hijack_io"=>nil, "HTTP_VERSION"=>"HTTP/1.1", "REQUEST_PATH"=>"/site", "rack.tempfiles"=>[]}
  }

  let(:request) { Rack::Request.new(mock_env) }

  describe 'validate params for initializing object ApplicationController' do
    it 'should be created object' do
      expect(subject.new(request)).to be_is_a LinkParser::ApplicationController
    end

    it 'should be raise InvalidParams' do
      expect{ subject.new('') }.to raise_error(LinkParser::InvalidParams, /Request must be object Rack::Request/)
    end
  end
end
