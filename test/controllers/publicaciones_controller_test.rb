require "test_helper"

describe PublicacionesController do

  before do
    @publicacion = publicaciones(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicaciones)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create publicacion" do
    assert_difference('Publicacion.count') do
      post :create, publicacion: {  }
    end

    assert_redirected_to publicacion_path(assigns(:publicacion))
  end

  it "must show publicacion" do
    get :show, id: @publicacion
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @publicacion
    assert_response :success
  end

  it "must update publicacion" do
    put :update, id: @publicacion, publicacion: {  }
    assert_redirected_to publicacion_path(assigns(:publicacion))
  end

  it "must destroy publicacion" do
    assert_difference('Publicacion.count', -1) do
      delete :destroy, id: @publicacion
    end

    assert_redirected_to publicaciones_path
  end

end
