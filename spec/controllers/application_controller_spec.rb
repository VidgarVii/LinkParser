describe 'ApplicationController', type: :controller do
  subject { LinkParser::ApplicationController }

  let(:request) { Rack::Request.new(mock_env) }

  context 'validate params for initializing object ApplicationController' do
    it 'should be created object' do
      expect(subject.new(request)).to be_is_a LinkParser::ApplicationController
    end

    it 'should be raise InvalidParams' do
      expect{ subject.new('') }.to raise_error(LinkParser::InvalidParams, /Request must be object Rack::Request/)
    end
  end

  describe '#make_response' do
    let(:object) { subject.new(request) }

    it 'should be return array' do
      expect(object.make_response).to be_is_a(Array)
    end

    it 'should contains status 200' do
      expect(object.make_response.first).to eq 200
    end

    it 'should contains header hash' do
      expect(object.make_response.second).to be_is_a(Hash)
    end

    it 'should contains body array' do
      expect(object.make_response.last).to be_is_a(Array)
    end
  end
end
