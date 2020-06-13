require 'rails_helper'

describe "get all search animals route", :type => :request do

  before do
    @animals = FactoryBot.create_list(:animal, 50)
  end

  it 'returns all male animals ' do
    get '/search?gender=male'
    # count = JSON.parse(response.body).count{|x| x.gender == "Male"}
    result = JSON.parse(response.body).map{ |e| e.fetch("gender")}
    expect(result).to all(include('Male'))
  end

  it 'returns status code 200' do
    get '/search?species=dog'
    expect(response).to have_http_status(:success)
  end
end