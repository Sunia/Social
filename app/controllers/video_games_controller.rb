class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @video_games = VideoGame.all
    respond_with(@video_games)
  end

  def show
    @user = User.find(@video_game.user_id)
    respond_with(@video_game)
  end

  def new
    @video_game = VideoGame.new
    respond_with(@video_game)
  end

  def edit
    @user = User.find(@video_game.user_id)
  end

  def create
    @video_game = current_user.video_games.new(video_game_params)
    @video_game.save
    respond_with(@video_game)
  end

  def update
    @video_game.update(video_game_params)
    respond_with(@video_game)
  end

  def destroy
    @video_game.destroy
    respond_with(@video_game)
  end


  # Current user will follow the video game of the user
  def video_game_follow
    debugger
    puts 'H'
  end


  private
    def set_video_game
      @video_game = VideoGame.find(params[:id])
    end

    def video_game_params
      params.require(:video_game).permit(:name, :fav_character)

    end
end
