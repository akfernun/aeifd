require 'test_helper'

class IncidentAssignmentsControllerTest < ActionController::TestCase
  setup do
    @incident_assignment = incident_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident_assignment" do
    assert_difference('IncidentAssignment.count') do
      post :create, incident_assignment: { asset_id: @incident_assignment.asset_id, asset_role_id: @incident_assignment.asset_role_id, incident_id: @incident_assignment.incident_id, location_id: @incident_assignment.location_id }
    end

    assert_redirected_to incident_assignment_path(assigns(:incident_assignment))
  end

  test "should show incident_assignment" do
    get :show, id: @incident_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident_assignment
    assert_response :success
  end

  test "should update incident_assignment" do
    patch :update, id: @incident_assignment, incident_assignment: { asset_id: @incident_assignment.asset_id, asset_role_id: @incident_assignment.asset_role_id, incident_id: @incident_assignment.incident_id, location_id: @incident_assignment.location_id }
    assert_redirected_to incident_assignment_path(assigns(:incident_assignment))
  end

  test "should destroy incident_assignment" do
    assert_difference('IncidentAssignment.count', -1) do
      delete :destroy, id: @incident_assignment
    end

    assert_redirected_to incident_assignments_path
  end
end
