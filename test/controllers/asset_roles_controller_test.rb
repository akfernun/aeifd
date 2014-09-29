require 'test_helper'

class AssetRolesControllerTest < ActionController::TestCase
  setup do
    @asset_role = asset_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_role" do
    assert_difference('AssetRole.count') do
      post :create, asset_role: { name: @asset_role.name }
    end

    assert_redirected_to asset_role_path(assigns(:asset_role))
  end

  test "should show asset_role" do
    get :show, id: @asset_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_role
    assert_response :success
  end

  test "should update asset_role" do
    patch :update, id: @asset_role, asset_role: { name: @asset_role.name }
    assert_redirected_to asset_role_path(assigns(:asset_role))
  end

  test "should destroy asset_role" do
    assert_difference('AssetRole.count', -1) do
      delete :destroy, id: @asset_role
    end

    assert_redirected_to asset_roles_path
  end
end
