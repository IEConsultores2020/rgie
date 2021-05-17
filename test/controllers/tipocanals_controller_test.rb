require 'test_helper'

class TipocanalsControllerTest < ActionController::TestCase
  setup do
    @tipocanal = tipocanals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipocanals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipocanal" do
    assert_difference('Tipocanal.count') do
      post :create, tipocanal: { nombre: @tipocanal.nombre, user_id: @tipocanal.user_id }
    end

    assert_redirected_to tipocanal_path(assigns(:tipocanal))
  end

  test "should show tipocanal" do
    get :show, id: @tipocanal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipocanal
    assert_response :success
  end

  test "should update tipocanal" do
    patch :update, id: @tipocanal, tipocanal: { nombre: @tipocanal.nombre, user_id: @tipocanal.user_id }
    assert_redirected_to tipocanal_path(assigns(:tipocanal))
  end

  test "should destroy tipocanal" do
    assert_difference('Tipocanal.count', -1) do
      delete :destroy, id: @tipocanal
    end

    assert_redirected_to tipocanals_path
  end
end
