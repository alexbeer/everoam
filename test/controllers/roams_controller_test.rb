require 'test_helper'

class RoamsControllerTest < ActionController::TestCase
  setup do
    @roam = roams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roam" do
    assert_difference('Roam.count') do
      post :create, roam: { title: @roam.title }
    end

    assert_redirected_to roam_path(assigns(:roam))
  end

  test "should show roam" do
    get :show, id: @roam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roam
    assert_response :success
  end

  test "should update roam" do
    patch :update, id: @roam, roam: { title: @roam.title }
    assert_redirected_to roam_path(assigns(:roam))
  end

  test "should destroy roam" do
    assert_difference('Roam.count', -1) do
      delete :destroy, id: @roam
    end

    assert_redirected_to roams_path
  end
end
