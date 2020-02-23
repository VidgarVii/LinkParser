describe LinkParser::SiteFactory do
  let(:urls) { %w(https://yandex.ru/ https://ruby-doc.org/) }
  subject { LinkParser::SiteFactory.new(urls) }

  describe '#async_create' do
    it 'objects site should write to the db' do
      expect { subject.async_create }.to change(LinkParser::Site, :count).by(2)
    end

    it 'should return 2 objects' do
      expect(subject.async_create.size).to eq 2
    end

    it 'return data should contain public attrs' do
      %i(status title url).each do |attr|
        expect(subject.async_create.first.has_key?(attr)).to be_truthy
      end
    end
  end
end
