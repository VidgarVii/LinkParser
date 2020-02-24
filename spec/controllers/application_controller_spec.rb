# frozen_string_literal: true

describe LinkParser::AbstractController, type: :controller do
  subject { LinkParser::AbstractController }
  include_context 'shared_env'

  let(:request) { Rack::Request.new(shared_env) }
  let(:object) { subject.new(request) }

  context 'validate params for initializing object ApplicationController' do
    it 'should be created object' do
      expect(subject.new(request)).to be_is_a LinkParser::AbstractController
    end

    it 'should be raise InvalidParams' do
      expect { subject.new('') }.to raise_error(LinkParser::InvalidParams, /Request must be object Rack::Request/)
    end
  end

  describe '#make_response' do
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

  describe '#render' do
    context 'should prepare response' do
      before { object.render :json, { url: 'http://site.com' } }

      it 'content type should be json' do
        expect(object.response.get_header('Content-Type')).to eq 'application/json'
      end

      it 'add content to the response body' do
        expect(object.response.body).to eq ['{"url":"http://site.com"}']
      end
    end

    it 'should rescue raise error if undefined content type' do
      expect { object.render :invalid_type, 'message' }.to raise_error LinkParser::InvalidParams
    end
  end
end
