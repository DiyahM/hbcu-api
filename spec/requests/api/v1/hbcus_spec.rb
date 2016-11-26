require 'rails_helper'

describe "HBCU API" do

  it 'sends a list of hbcus' do
    FactoryGirl.create_list(:hbcu, 10)
    get '/api/v1/hbcus'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['data'].length).to eq(10)
  end

end
