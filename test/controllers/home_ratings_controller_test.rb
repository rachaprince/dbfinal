require 'test_helper'

class HomeRatingsControllerTest < ActionController::TestCase
  setup do
    @home_rating = home_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_rating" do
    assert_difference('HomeRating.count') do
      post :create, home_rating: { committee_id: @home_rating.committee_id, explanation: @home_rating.explanation, participant_id: @home_rating.participant_id, prep_explanation: @home_rating.prep_explanation, prep_rating: @home_rating.prep_rating, prior_difficulties: @home_rating.prior_difficulties, rating: @home_rating.rating }
    end

    assert_redirected_to home_rating_path(assigns(:home_rating))
  end

  test "should show home_rating" do
    get :show, id: @home_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_rating
    assert_response :success
  end

  test "should update home_rating" do
    patch :update, id: @home_rating, home_rating: { committee_id: @home_rating.committee_id, explanation: @home_rating.explanation, participant_id: @home_rating.participant_id, prep_explanation: @home_rating.prep_explanation, prep_rating: @home_rating.prep_rating, prior_difficulties: @home_rating.prior_difficulties, rating: @home_rating.rating }
    assert_redirected_to home_rating_path(assigns(:home_rating))
  end

  test "should destroy home_rating" do
    assert_difference('HomeRating.count', -1) do
      delete :destroy, id: @home_rating
    end

    assert_redirected_to home_ratings_path
  end
end
