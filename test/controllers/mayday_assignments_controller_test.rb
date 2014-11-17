require 'test_helper'

class MaydayAssignmentsControllerTest < ActionController::TestCase
  setup do
    @mayday_assignment = mayday_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mayday_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mayday_assignment" do
    assert_difference('MaydayAssignment.count') do
      post :create, mayday_assignment: { asset_id: @mayday_assignment.asset_id, mayday_id: @mayday_assignment.mayday_id }
    end

    assert_redirected_to mayday_assignment_path(assigns(:mayday_assignment))
  end

  test "should show mayday_assignment" do
    get :show, id: @mayday_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mayday_assignment
    assert_response :success
  end

  test "should update mayday_assignment" do
    patch :update, id: @mayday_assignment, mayday_assignment: { asset_id: @mayday_assignment.asset_id, mayday_id: @mayday_assignment.mayday_id }
    assert_redirected_to mayday_assignment_path(assigns(:mayday_assignment))
  end

  test "should destroy mayday_assignment" do
    assert_difference('MaydayAssignment.count', -1) do
      delete :destroy, id: @mayday_assignment
    end

    assert_redirected_to mayday_assignments_path
  end
end
