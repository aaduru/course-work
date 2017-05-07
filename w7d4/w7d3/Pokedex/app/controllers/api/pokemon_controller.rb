class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :attack, :image_url, :defense, :items, :poke_type, moves: [])
  end
end
