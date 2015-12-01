require 'test_helper'

class AwayRatingsControllerTest < ActionController::TestCase
  setup do
    @away_rating = away_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:away_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create away_rating" do
    assert_difference('AwayRating.count') do
      post :create, away_rating: { committee_id: @away_rating.committee_id, experience_difficulties: @away_rating.experience_difficulties, explanation: @away_rating.explanation, internship_id: @away_rating.internship_id, rating: @away_rating.rating, visa: @away_rating.visa }
    end

    assert_redirected_to away_rating_path(assigns(:away_rating))
  end

  test "should show away_rating" do
    get :show, id: @away_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @away_rating
    assert_response :success
  end

  test "should update away_rating" do
    patch :update, id: @away_rating, away_rating: { committee_id: @away_rating.committee_id, experience_difficulties: @away_rating.experience_difficulties, explanation: @away_rating.explanation, internship_id: @away_rating.internship_id, rating: @away_rating.rating, visa: @away_rating.visa }
    assert_redirected_to away_rating_path(assigns(:away_rating))
  end

  test "should destroy away_rating" do
    assert_difference('AwayRating.count', -1) do
      delete :destroy, id: @away_rating
    end

    assert_redirected_to away_ratings_path
  end
end
