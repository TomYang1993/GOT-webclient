class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by(id: params[:id])
  end

  def new
    render "new"
  end

  def create
    @character = Character.create(
      name: params[:name],
      city: params[:city],
      house: params[:house]
    )
    redirect_to "/characters/#{@character.id}"
  end

  def edit
    @character = Character.find_by(id: params[:id])
  end

  def update
    @character = Character.find_by(id: params[:id])
    @character.update(
      id: params[:id],
      name: params[:name],
      city: params[:city],
      house: params[:house]
    )
    redirect_to "/characters/#{params[:id]}"
  end

  def destroy
    @character = Character.find_by(id: params[:id])
    @character.destroy
    render "destroy"
  end
end
