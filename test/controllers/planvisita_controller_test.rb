require 'test_helper'

class PlanvisitaControllerTest < ActionController::TestCase
  setup do
    @planvisitum = planvisita(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planvisita)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planvisitum" do
    assert_difference('Planvisitum.count') do
      post :create, planvisitum: { fechavisita: @planvisitum.fechavisita, puntoventum_id: @planvisitum.puntoventum_id, user_id: @planvisitum.user_id, usuarioasignado: @planvisitum.usuarioasignado }
    end

    assert_redirected_to planvisitum_path(assigns(:planvisitum))
  end

  test "should show planvisitum" do
    get :show, id: @planvisitum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planvisitum
    assert_response :success
  end

  test "should update planvisitum" do
    patch :update, id: @planvisitum, planvisitum: { fechavisita: @planvisitum.fechavisita, puntoventum_id: @planvisitum.puntoventum_id, user_id: @planvisitum.user_id, usuarioasignado: @planvisitum.usuarioasignado }
    assert_redirected_to planvisitum_path(assigns(:planvisitum))
  end

  test "should destroy planvisitum" do
    assert_difference('Planvisitum.count', -1) do
      delete :destroy, id: @planvisitum
    end

    assert_redirected_to planvisita_path
  end
end
