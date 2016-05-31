class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update, :destroy]
  before_action :set_user
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
    @video_game = VideoGame.find(params[:game_id])
    @user = User.find(params[:user_id])

    # User who visited the game profile followed that game.
    @user.follow(@video_game)
  end

  def video_game_unfollow
    @video_game = VideoGame.find(params[:game_id])
    @user = User.find(params[:user_id])

    # User who visited the game profile unfollowed that game.
    @user.stop_following(@video_game)    
  end

  private
    def set_video_game
      @video_game = VideoGame.find(params[:id])
    end

    def video_game_params
      params.require(:video_game).permit(:name, :fav_character)
    end

    def set_user
      @user = current_user
    end

end