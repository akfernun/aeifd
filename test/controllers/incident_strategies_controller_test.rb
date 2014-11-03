require 'test_helper'

class IncidentStrategiesControllerTest < ActionController::TestCase
  setup do
    @incident_strategy = incident_strategies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_strategies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident_strategy" do
    assert_difference('IncidentStrategy.count') do
      post :create, incident_strategy: { name: @incident_strategy.name }
    end

    assert_redirected_to incident_strategy_path(assigns(:incident_strategy))
  end

  test "should show incident_strategy" do
    get :show, id: @incident_strategy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident_strategy
    assert_response :success
  end

  test "should update incident_strategy" do
    patch :update, id: @incident_strategy, incident_strategy: { name: @incident_strategy.name }
    assert_redirected_to incident_strategy_path(assigns(:incident_strategy))
  end

  test "should destroy incident_strategy" do
    assert_difference('IncidentStrategy.count', -1) do
      delete :destroy, id: @incident_strategy
    end

    assert_redirected_to incident_strategies_path
  end
end
