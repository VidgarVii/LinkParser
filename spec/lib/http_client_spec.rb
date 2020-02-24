# frozen_string_literal: true

describe LinkParser::Adapters::HTTPClient do
  subject { LinkParser::Adapters::HTTPClient.instance }

  describe '#get' do
    let(:book) { double('Faraday') }
    let(:books) { instance_double('Book', pages: 250) }

    it 'send get request through http client' do
      expect(subject.http_client).to receive(:get)

      subject.get('http://site.com')
    end
  end
end
