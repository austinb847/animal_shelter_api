require 'rails_helper'

describe 'Delete animal route', :type => :request do
  before(:each) do
    @animal = FactoryBot.create(:animal)
  end

  it 'deletes an animal' do
    delete "/animals/#{@animal.id}"
    expect(response.status).to eq(200)
    expect(Animal.all).to eq([])
  end
  
  it 'returns a 404 status not found' do
    delete "/animals/500"
    expect(response.status).to eq(404)
  end

  it 'returns a 404 error message correctly' do
    delete "/animals/500"
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Animal with 'id'=500")
  end
end