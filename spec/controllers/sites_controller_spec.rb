describe LinkParser::SitesController, type: :controller do
  subject { LinkParser::SitesController }

  describe 'POST #create' do
    let(:post_request) { post :create, params: { 'links' => ['https://github.com/','https://www.ruby-toolbox.com/','https://draw.io'] } }

    context 'valid params' do
      before { post_request }

      it 'should return status 200' do
        expect(response.status).to eq 200
      end

      it 'should return collections sites in the body' do
        %w[url status title].each do |attr|
          expect(JSON.parse(response.body.first).first.has_key?(attr)).to be_truthy
        end
      end

      it 'should return content type - json' do
        expect(response.header['Content-Type']).to eq 'application/json'
      end

      it 'should created 3 sites to DB' do
        expect(LinkParser::Site.count).to eq 3
      end
    end

    context 'not valid params' do
      it 'should return link undefined' do
        post :create

        expect(response.body).to eq ["{\"error\":\"links undefined\"}"]
      end
    end
  end
end
