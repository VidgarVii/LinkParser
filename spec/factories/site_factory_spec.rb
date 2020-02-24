# frozen_string_literal: true

describe LinkParser::SiteFactory do
  let(:urls) { %w[https://yandex.ru/ https://ruby-doc.org/] }
  subject { LinkParser::SiteFactory.new(urls) }

  describe '#async_create' do
    it 'objects site should write to the db' do
      expect { subject.async_create }.to change(LinkParser::Site, :count).by(2)
    end

    it 'should return 2 objects' do
      expect(subject.async_create.size).to eq 2
    end

    it 'return data should contain public attrs' do
      %i[status title url].each do |attr|
        expect(subject.async_create[:success].first.key?(attr)).to be_truthy
      end
    end

    context 'handle error if ConnectionFailed' do
      let(:bad_url) { %w[http://bad_site.ru] }
      subject { LinkParser::SiteFactory.new(bad_url) }

      it 'bad link should contain in the return data[:error]' do
        expect(subject.async_create[:errors].first).to eq 'http://bad_site.ru'
      end
    end
  end

  describe '#create' do
    it 'objects site should write to the db' do
      expect { subject.create }.to change(LinkParser::Site, :count).by(2)
    end

    it 'should return 2 objects' do
      expect(subject.create.size).to eq 2
    end

    it 'return data should contain public attrs' do
      %i[status title url].each do |attr|
        expect(subject.create[:success].first.key?(attr)).to be_truthy
      end
    end
  end
end
