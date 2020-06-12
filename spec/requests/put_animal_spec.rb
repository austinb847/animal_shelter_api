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
  
end