require 'test_helper'

class MaydaysControllerTest < ActionController::TestCase
  setup do
    @mayday = maydays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maydays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mayday" do
    assert_difference('Mayday.count') do
      post :create, mayday: { incident_assignment_id: @mayday.incident_assignment_id }
    end

    assert_redirected_to mayday_path(assigns(:mayday))
  end

  test "should show mayday" do
    get :show, id: @mayday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mayday
    assert_response :success
  end

  test "should update mayday" do
    patch :update, id: @mayday, mayday: { incident_assignment_id: @mayday.incident_assignment_id }
    assert_redirected_to mayday_path(assigns(:mayday))
  end

  test "should destroy mayday" do
    assert_difference('Mayday.count', -1) do
      delete :destroy, id: @mayday
    end

    assert_redirected_to maydays_path
  end
end
