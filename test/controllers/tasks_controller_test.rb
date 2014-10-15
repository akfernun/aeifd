require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { all_clear: @task.all_clear, fire_under_control: @task.fire_under_control, primar_search: @task.primar_search, safety_officer_arrived: @task.safety_officer_arrived, secondary_search: @task.secondary_search, utilities_contacted: @task.utilities_contacted, utilities_disconnected: @task.utilities_disconnected }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { all_clear: @task.all_clear, fire_under_control: @task.fire_under_control, primar_search: @task.primar_search, safety_officer_arrived: @task.safety_officer_arrived, secondary_search: @task.secondary_search, utilities_contacted: @task.utilities_contacted, utilities_disconnected: @task.utilities_disconnected }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
