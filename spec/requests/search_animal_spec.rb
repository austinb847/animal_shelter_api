require 'rails_helper'

describe "get all search animals route", :type => :request do

  before do
    @animals = FactoryBot.create_list(:animal, 20)
  end

  it 'returns all dogs ' do
    get '/search?species=dog'
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    get '/search?species=dog'
    expect(response).to have_http_status(:success)
  end
end