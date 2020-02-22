describe LinkParser::SitesController, type: :controller do
  subject { LinkParser::SitesController }

  let(:post_request) { post :create, params: { links: ['https://github.com/','https://www.ruby-toolbox.com/','draw.io']} }

  describe 'POST #create' do
    before { post_request }

    it 'should return status 200' do
      expect(response.status).to eq 200
    end

    it 'should return body' do
      expect(response.body).to eq ["\nSites created"]
    end

    it 'should created 3 sites to DB' do
      expect(LinkParser::Site.count).to eq 3
    end
  end
end
