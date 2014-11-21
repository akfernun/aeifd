require 'test_helper'

class CheckoffsControllerTest < ActionController::TestCase
  setup do
    @checkoff = checkoffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkoffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkoff" do
    assert_difference('Checkoff.count') do
      post :create, checkoff: { name: @checkoff.name, type: @checkoff.type }
    end

    assert_redirected_to checkoff_path(assigns(:checkoff))
  end

  test "should show checkoff" do
    get :show, id: @checkoff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkoff
    assert_response :success
  end

  test "should update checkoff" do
    patch :update, id: @checkoff, checkoff: { name: @checkoff.name, type: @checkoff.type }
    assert_redirected_to checkoff_path(assigns(:checkoff))
  end

  test "should destroy checkoff" do
    assert_difference('Checkoff.count', -1) do
      delete :destroy, id: @checkoff
    end

    assert_redirected_to checkoffs_path
  end
end
