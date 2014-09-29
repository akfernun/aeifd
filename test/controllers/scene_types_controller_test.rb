require 'test_helper'

class SceneTypesControllerTest < ActionController::TestCase
  setup do
    @scene_type = scene_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene_type" do
    assert_difference('SceneType.count') do
      post :create, scene_type: { name: @scene_type.name }
    end

    assert_redirected_to scene_type_path(assigns(:scene_type))
  end

  test "should show scene_type" do
    get :show, id: @scene_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene_type
    assert_response :success
  end

  test "should update scene_type" do
    patch :update, id: @scene_type, scene_type: { name: @scene_type.name }
    assert_redirected_to scene_type_path(assigns(:scene_type))
  end

  test "should destroy scene_type" do
    assert_difference('SceneType.count', -1) do
      delete :destroy, id: @scene_type
    end

    assert_redirected_to scene_types_path
  end
end
