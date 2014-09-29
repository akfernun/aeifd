require 'test_helper'

class SceneAssignmentsControllerTest < ActionController::TestCase
  setup do
    @scene_assignment = scene_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene_assignment" do
    assert_difference('SceneAssignment.count') do
      post :create, scene_assignment: { arrival_time: @scene_assignment.arrival_time, asset_id: @scene_assignment.asset_id, location: @scene_assignment.location, scene_id: @scene_assignment.scene_id }
    end

    assert_redirected_to scene_assignment_path(assigns(:scene_assignment))
  end

  test "should show scene_assignment" do
    get :show, id: @scene_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene_assignment
    assert_response :success
  end

  test "should update scene_assignment" do
    patch :update, id: @scene_assignment, scene_assignment: { arrival_time: @scene_assignment.arrival_time, asset_id: @scene_assignment.asset_id, location: @scene_assignment.location, scene_id: @scene_assignment.scene_id }
    assert_redirected_to scene_assignment_path(assigns(:scene_assignment))
  end

  test "should destroy scene_assignment" do
    assert_difference('SceneAssignment.count', -1) do
      delete :destroy, id: @scene_assignment
    end

    assert_redirected_to scene_assignments_path
  end
end
