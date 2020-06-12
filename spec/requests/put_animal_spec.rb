require 'rails_helper'

describe 'Update animal route', :type => :request do
  before(:each) do
    @animal = FactoryBot.create(:animal)
  end

  it 'updates an animal' do
    @new_name = 'test'
    @new_breed = 'test breed'
    put "/animals/#{@animal.id}", params: {name: @new_name, breed: @new_breed}
    expect(response.status).to eq(200)
    expect(Animal.find(@animal.id).name).to eq(@new_name)
    expect(Animal.find(@animal.id).breed).to eq(@new_breed)
  end
  
  it 'returns a 404 status not found' do
    @new_name = 'test'
    @new_breed = 'test breed'
    put "/animals/12", params: {name: @new_name, breed: @new_breed}
    expect(response.status).to eq(404)
  end

  it 'returns a 404 error message correctly' do
    @new_name = 'test'
    @new_breed = 'test breed'
    put "/animals/12", params: {name: @new_name, breed: @new_breed}
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Animal with 'id'=12")
  end
end