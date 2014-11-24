require 'test_helper'

class CheckoffMaydaysControllerTest < ActionController::TestCase
  setup do
    @checkoff_mayday = checkoff_maydays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkoff_maydays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkoff_mayday" do
    assert_difference('CheckoffMayday.count') do
      post :create, checkoff_mayday: { checkoff_id: @checkoff_mayday.checkoff_id, mayday_id: @checkoff_mayday.mayday_id, status: @checkoff_mayday.status }
    end

    assert_redirected_to checkoff_mayday_path(assigns(:checkoff_mayday))
  end

  test "should show checkoff_mayday" do
    get :show, id: @checkoff_mayday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkoff_mayday
    assert_response :success
  end

  test "should update checkoff_mayday" do
    patch :update, id: @checkoff_mayday, checkoff_mayday: { checkoff_id: @checkoff_mayday.checkoff_id, mayday_id: @checkoff_mayday.mayday_id, status: @checkoff_mayday.status }
    assert_redirected_to checkoff_mayday_path(assigns(:checkoff_mayday))
  end

  test "should destroy checkoff_mayday" do
    assert_difference('CheckoffMayday.count', -1) do
      delete :destroy, id: @checkoff_mayday
    end

    assert_redirected_to checkoff_maydays_path
  end
end
