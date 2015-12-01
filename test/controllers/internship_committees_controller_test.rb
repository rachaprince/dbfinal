require 'test_helper'

class InternshipCommitteesControllerTest < ActionController::TestCase
  setup do
    @internship_committee = internship_committees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internship_committees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internship_committee" do
    assert_difference('InternshipCommittee.count') do
      post :create, internship_committee: { away_c_id: @internship_committee.away_c_id, home_c_id: @internship_committee.home_c_id, internship_id: @internship_committee.internship_id }
    end

    assert_redirected_to internship_committee_path(assigns(:internship_committee))
  end

  test "should show internship_committee" do
    get :show, id: @internship_committee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internship_committee
    assert_response :success
  end

  test "should update internship_committee" do
    patch :update, id: @internship_committee, internship_committee: { away_c_id: @internship_committee.away_c_id, home_c_id: @internship_committee.home_c_id, internship_id: @internship_committee.internship_id }
    assert_redirected_to internship_committee_path(assigns(:internship_committee))
  end

  test "should destroy internship_committee" do
    assert_difference('InternshipCommittee.count', -1) do
      delete :destroy, id: @internship_committee
    end

    assert_redirected_to internship_committees_path
  end
end
