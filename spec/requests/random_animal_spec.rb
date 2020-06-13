require 'rails_helper'

describe "get random animals route", :type => :request do
  let!(:animals) {FactoryBot.create_list(:animal, 20)}

  before { get '/random'}

  it 'returns an random animal' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end