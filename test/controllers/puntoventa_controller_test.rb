require 'test_helper'

class PuntoventaControllerTest < ActionController::TestCase
  setup do
    @puntoventum = puntoventa(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puntoventa)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puntoventum" do
    assert_difference('Puntoventum.count') do
      post :create, puntoventum: { ciudad_id: @puntoventum.ciudad_id, direccion: @puntoventum.direccion, email: @puntoventum.email, latitude: @puntoventum.latitude, longitude: @puntoventum.longitude, mtsmaxdistancia: @puntoventum.mtsmaxdistancia, name: @puntoventum.name, telefonos: @puntoventum.telefonos, tipocanal_id: @puntoventum.tipocanal_id, user_id: @puntoventum.user_id }
    end

    assert_redirected_to puntoventum_path(assigns(:puntoventum))
  end

  test "should show puntoventum" do
    get :show, id: @puntoventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @puntoventum
    assert_response :success
  end

  test "should update puntoventum" do
    patch :update, id: @puntoventum, puntoventum: { ciudad_id: @puntoventum.ciudad_id, direccion: @puntoventum.direccion, email: @puntoventum.email, latitude: @puntoventum.latitude, longitude: @puntoventum.longitude, mtsmaxdistancia: @puntoventum.mtsmaxdistancia, name: @puntoventum.name, telefonos: @puntoventum.telefonos, tipocanal_id: @puntoventum.tipocanal_id, user_id: @puntoventum.user_id }
    assert_redirected_to puntoventum_path(assigns(:puntoventum))
  end

  test "should destroy puntoventum" do
    assert_difference('Puntoventum.count', -1) do
      delete :destroy, id: @puntoventum
    end

    assert_redirected_to puntoventa_path
  end
end
