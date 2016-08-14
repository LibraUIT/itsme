require 'test_helper'

class IdolsControllerTest < ActionController::TestCase
  setup do
    @idol = idols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idol" do
    assert_difference('Idol.count') do
      post :create, idol: { name: @idol.name, slug: @idol.slug }
    end

    assert_redirected_to idol_path(assigns(:idol))
  end

  test "should show idol" do
    get :show, id: @idol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idol
    assert_response :success
  end

  test "should update idol" do
    patch :update, id: @idol, idol: { name: @idol.name, slug: @idol.slug }
    assert_redirected_to idol_path(assigns(:idol))
  end

  test "should destroy idol" do
    assert_difference('Idol.count', -1) do
      delete :destroy, id: @idol
    end

    assert_redirected_to idols_path
  end
end
