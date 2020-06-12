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
    @animal = Animal.create(animal_params)
    json_response(@animal)
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
  end

  private
  def animal_params
    params.permit(:species, :breed, :age, :name, :gender)
  end


end