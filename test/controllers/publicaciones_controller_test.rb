require "test_helper"

describe PublicacionesController do

  before do
    @publicacion = publicaciones(:quijote)
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
      post(
        :create, 
        publicacion: {
          titulo: "El Ingenioso Hidalgo Don Quijote de La Mancha",
          texto: "En un lugar de La Mancha de cuyo nombre no quiero acordarme...",
          autor_id: autores(:cervantes).id,
          tipo_id: tipos_publicaciones(:novela).id
        }
      )
    end

    assert_redirected_to publicacion_path(assigns(:publicacion))
  end

  it "must show publicacion" do
    get :show, id: @publicacion, autor_id: @publicacion.autor
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @publicacion
    assert_response :success
  end

  it "must update publicacion" do
    put(
      :update,
      id: @publicacion,
      publicacion: {
        titulo: "El Ingenioso Hidalgo Don Quijote de La Mancha",
        texto: "En un lugar de La Mancha de cuyo nombre no quiero acordarme...",
        autor_id: autores(:cervantes).id,
        tipo_id: tipos_publicaciones(:novela).id
      }
    )
    assert_redirected_to publicacion_path(assigns(:publicacion))
  end

  it "must destroy publicacion" do
    assert_difference('Publicacion.count', -1) do
      delete :destroy, id: @publicacion
    end

    assert_redirected_to publicaciones_path
  end

end
