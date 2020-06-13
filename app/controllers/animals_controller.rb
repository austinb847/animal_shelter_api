class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
        message: "This animal has been updated successfully."
        }
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy!
      render status: 200, json: {
        message: "This animal has been deleted successfully."
        }
    end
  end

  def random
    @animal = Animal.random_animal
    json_response(@animal)
  end

  def search
   @animals = Animal.where(nil)
   search_params(params).each do |key, value|
    @animals = @animals.public_send("search_by_#{key.downcase}", value) if value.present?
   end

   if @animals.length == 0
    render status: 200, json: {
      message: "No animals based on your search."
      }
    else
      json_response(@animals)
    end
  end

  private
  def animal_params
    params.permit(:species, :breed, :age, :name, :gender)
  end

  def search_params(params)
    params.slice(:species, :breed, :gender)
  end


end