class GamesController < ApplicationController
  # Add your GamesController code here
  before_action :set_game, only: [:show, :update]

  def index
    games = Game.all
    render json: games
  end

  def create
    @game = Game.create(game_params)
    redirect_to @game
  end

  def show
    render json: @game
  end

  def update
    @game.update(game_params)
    render json: @game
  end

  private

  def game_params
    params.permit(:state => [])
  end

  def set_game
    @game = Game.find_by(id: params[:id])
  end

end
