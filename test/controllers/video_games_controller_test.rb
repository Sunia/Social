require 'test_helper'

class VideoGamesControllerTest < ActionController::TestCase
  setup do
    @video_game = video_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_game" do
    assert_difference('VideoGame.count') do
      post :create, video_game: {  }
    end

    assert_redirected_to video_game_path(assigns(:video_game))
  end

  test "should show video_game" do
    get :show, id: @video_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_game
    assert_response :success
  end

  test "should update video_game" do
    patch :update, id: @video_game, video_game: {  }
    assert_redirected_to video_game_path(assigns(:video_game))
  end

  test "should destroy video_game" do
    assert_difference('VideoGame.count', -1) do
      delete :destroy, id: @video_game
    end

    assert_redirected_to video_games_path
  end
end
