require 'test_helper'

class ArticulosControllerTest < ActionController::TestCase
  setup do
    @articulo = articulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create articulo" do
    assert_difference('Articulo.count') do
      post :create, articulo: { barcode: @articulo.barcode, componente_id: @articulo.componente_id, descripcion: @articulo.descripcion, foto: @articulo.foto, modelo_id: @articulo.modelo_id, nombre: @articulo.nombre, unidad_medida_id: @articulo.unidad_medida_id }
    end

    assert_redirected_to articulo_path(assigns(:articulo))
  end

  test "should show articulo" do
    get :show, id: @articulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @articulo
    assert_response :success
  end

  test "should update articulo" do
    patch :update, id: @articulo, articulo: { barcode: @articulo.barcode, componente_id: @articulo.componente_id, descripcion: @articulo.descripcion, foto: @articulo.foto, modelo_id: @articulo.modelo_id, nombre: @articulo.nombre, unidad_medida_id: @articulo.unidad_medida_id }
    assert_redirected_to articulo_path(assigns(:articulo))
  end

  test "should destroy articulo" do
    assert_difference('Articulo.count', -1) do
      delete :destroy, id: @articulo
    end

    assert_redirected_to articulos_path
  end
end
