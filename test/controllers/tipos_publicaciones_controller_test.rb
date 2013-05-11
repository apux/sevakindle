require "test_helper"

describe TiposPublicacionesController do

  before do
    @tipo_publicacion = tipos_publicaciones(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_publicaciones)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create tipo_publicacion" do
    assert_difference('TipoPublicacion.count') do
      post :create, tipo_publicacion: {  }
    end

    assert_redirected_to tipo_publicacion_path(assigns(:tipo_publicacion))
  end

  it "must show tipo_publicacion" do
    get :show, id: @tipo_publicacion
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @tipo_publicacion
    assert_response :success
  end

  it "must update tipo_publicacion" do
    put :update, id: @tipo_publicacion, tipo_publicacion: {  }
    assert_redirected_to tipo_publicacion_path(assigns(:tipo_publicacion))
  end

  it "must destroy tipo_publicacion" do
    assert_difference('TipoPublicacion.count', -1) do
      delete :destroy, id: @tipo_publicacion
    end

    assert_redirected_to tipos_publicaciones_path
  end

end
