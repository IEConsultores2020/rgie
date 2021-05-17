require 'test_helper'

class ConteosControllerTest < ActionController::TestCase
  setup do
    @conteo = conteos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conteos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conteo" do
    assert_difference('Conteo.count') do
      post :create, conteo: { cantidad: @conteo.cantidad, codbarras: @conteo.codbarras, inventario_id: @conteo.inventario_id }
    end

    assert_redirected_to conteo_path(assigns(:conteo))
  end

  test "should show conteo" do
    get :show, id: @conteo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conteo
    assert_response :success
  end

  test "should update conteo" do
    patch :update, id: @conteo, conteo: { cantidad: @conteo.cantidad, codbarras: @conteo.codbarras, inventario_id: @conteo.inventario_id }
    assert_redirected_to conteo_path(assigns(:conteo))
  end

  test "should destroy conteo" do
    assert_difference('Conteo.count', -1) do
      delete :destroy, id: @conteo
    end

    assert_redirected_to conteos_path
  end
end
