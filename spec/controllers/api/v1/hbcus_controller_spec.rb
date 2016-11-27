require 'rails_helper'

RSpec.describe Api::V1::HbcusController, type: :controller do
  describe 'GET index' do
    let!(:hbcu) { FactoryGirl.create(:hbcu, name: 'U of Virgin Island',
                                    street_address: '345 Cookie Man Dr',
                                    city: 'Island City',
                                    state: 'VI',
                                    zip_code: '34567',
                                    latitude: -1,
                                    longitude: -2,
                                    mission_statement: 'Everything Irie') }

    context 'when valid access token is provided' do
      let(:user) { FactoryGirl.create(:user) }

      def make_request
        request.headers['HTTP_AUTHORIZATION'] =  "Token token=#{user.api_key}"
        get :index
      end

      it 'returns http sucess' do
        make_request
        expect(response).to have_http_status(:success)
      end

      it 'response with JSON body containing expected Hbcu attributes' do
        make_request
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body).to match({ data: [ id: hbcu.id.to_s, type: 'hbcus', attributes: { name: 'U of Virgin Island', street_address: '345 Cookie Man Dr', city: 'Island City', state: 'VI', zip_code: '34567', latitude: '-1.0', longitude: '-2.0', mission_statement: 'Everything Irie' } ]})
      end
    end

    context 'when no access token is provided' do
      it 'returns http unauthorized' do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns Bad Credentials' do
        get :index
        expect(response.body).to match('Bad credentials')
      end
    end
  end
end
