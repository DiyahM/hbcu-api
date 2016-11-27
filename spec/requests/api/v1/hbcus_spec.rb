require 'rails_helper'

describe "HBCU API" do

  context 'when access token is not provided' do
    it 'response with Bad Credentials error' do
      get '/api/v1/hbcus'
      expect(response).to be_unauthorized
      expect(response.body).to eq 'Bad credentials'
    end
  end

  context 'when valid access token is provided' do
    let(:user) { FactoryGirl.create(:user) }

    it 'sends a list of hbcus' do
      FactoryGirl.create_list(:hbcu, 10)
      get '/api/v1/hbcus', headers: { 'HTTP_AUTHORIZATION': "Token token=#{user.api_key}" }
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json['data'].length).to eq(10)
    end
  end

end
