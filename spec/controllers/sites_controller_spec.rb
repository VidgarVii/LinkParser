describe LinkParser::SitesController, type: :controller do
  subject { LinkParser::SitesController }

  describe 'POST #create' do
    let(:post_request) { post :create, params: { 'links' => ['https://github.com/','https://www.ruby-toolbox.com/','https://draw.io'] } }

    context 'valid params' do
      before { post_request }

      it 'should return status 200' do
        expect(response.status).to eq 200
      end

      it 'should return body' do
        expect(response.body).to eq ['Data write successfully']
      end

      it 'should created 3 sites to DB' do
        expect(LinkParser::Site.count).to eq 3
      end
    end

    context 'not valid params' do
      it 'should return link undefined' do
        post :create

        expect(response.body).to eq ['Links undefined']
      end
    end
  end
end
