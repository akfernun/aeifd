require 'test_helper'

class BattalionsControllerTest < ActionController::TestCase
  setup do
    @battalion = battalions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battalions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battalion" do
    assert_difference('Battalion.count') do
      post :create, battalion: { name: @battalion.name }
    end

    assert_redirected_to battalion_path(assigns(:battalion))
  end

  test "should show battalion" do
    get :show, id: @battalion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battalion
    assert_response :success
  end

  test "should update battalion" do
    patch :update, id: @battalion, battalion: { name: @battalion.name }
    assert_redirected_to battalion_path(assigns(:battalion))
  end

  test "should destroy battalion" do
    assert_difference('Battalion.count', -1) do
      delete :destroy, id: @battalion
    end

    assert_redirected_to battalions_path
  end
end
