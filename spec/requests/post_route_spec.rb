require 'rails_helper'

describe "post a animal route", :type => :request do

  before do
    post '/animals', params: { :species => 'Dog', :breed => 'lab', :age => 3, :name => 'Melvin', :gender => 'Male' }  
  end

  it 'returns the animal name' do
    expect(JSON.parse(response.body)['name']).to eq('Melvin')
  end

  it 'returns the species' do
    expect(JSON.parse(response.body)['species']).to eq('Dog')
  end

  it 'returns the breed' do
    expect(JSON.parse(response.body)['breed']).to eq('lab')
  end

  it 'returns the age' do
    expect(JSON.parse(response.body)['age']).to eq(3)
  end

  it 'returns the gender' do
    expect(JSON.parse(response.body)['gender']).to eq('Male')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end