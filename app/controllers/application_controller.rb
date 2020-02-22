class ApplicationController
  attr_reader :params, :request, :response

  def initialize(request)
    @request = request
    @response = Rack::Response.new
  end

  def make_response
    [status, header, body]
  end

  private

  def status
    200
  end

  def header
    {'Content-Type' => 'text/plain'}
  end

  def body
    ["#{request.params}\n #{request.path}"]
  end
end
