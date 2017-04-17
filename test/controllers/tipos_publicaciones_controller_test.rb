require "test_helper"

describe TiposPublicacionesController do

  before do
    @tipo_publicacion = tipos_publicaciones(:novela)
  end

  it "must get index" do
    get tipos_publicaciones_path
    assert_response :success
  end

  it "must get new" do
    get new_tipo_publicacion_path
    assert_response :success
  end

  it "must create tipo_publicacion" do
    assert_difference('TipoPublicacion.count') do
      post tipos_publicaciones_path, params: { tipo_publicacion: { nombre: 'Ensayo' } }
    end

    assert_redirected_to tipo_publicacion_path(TipoPublicacion.last)
  end

  it "must show tipo_publicacion" do
    get tipo_publicacion_path(@tipo_publicacion)
    assert_response :success
  end

  it "must get edit" do
    get edit_tipo_publicacion_path(@tipo_publicacion)
    assert_response :success
  end

  it "must update tipo_publicacion" do
    put tipo_publicacion_path(@tipo_publicacion), params: { tipo_publicacion: { nombre: 'Ensayo' } }
    assert_redirected_to tipo_publicacion_path(@tipo_publicacion)
  end

  it "must destroy tipo_publicacion" do
    assert_difference('TipoPublicacion.count', -1) do
      delete tipo_publicacion_path(@tipo_publicacion)
    end

    assert_redirected_to tipos_publicaciones_path
  end
end
