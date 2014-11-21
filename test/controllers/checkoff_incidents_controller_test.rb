require 'test_helper'

class CheckoffIncidentsControllerTest < ActionController::TestCase
  setup do
    @checkoff_incident = checkoff_incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkoff_incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkoff_incident" do
    assert_difference('CheckoffIncident.count') do
      post :create, checkoff_incident: { checkoff_id: @checkoff_incident.checkoff_id, incident_id: @checkoff_incident.incident_id, status: @checkoff_incident.status }
    end

    assert_redirected_to checkoff_incident_path(assigns(:checkoff_incident))
  end

  test "should show checkoff_incident" do
    get :show, id: @checkoff_incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkoff_incident
    assert_response :success
  end

  test "should update checkoff_incident" do
    patch :update, id: @checkoff_incident, checkoff_incident: { checkoff_id: @checkoff_incident.checkoff_id, incident_id: @checkoff_incident.incident_id, status: @checkoff_incident.status }
    assert_redirected_to checkoff_incident_path(assigns(:checkoff_incident))
  end

  test "should destroy checkoff_incident" do
    assert_difference('CheckoffIncident.count', -1) do
      delete :destroy, id: @checkoff_incident
    end

    assert_redirected_to checkoff_incidents_path
  end
end
