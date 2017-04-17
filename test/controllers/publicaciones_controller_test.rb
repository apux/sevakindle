require "test_helper"

describe PublicacionesController do

  before do
    @publicacion = publicaciones(:quijote)
  end

  it "must get index" do
    get publicaciones_path
    assert_response :success
  end

  it "must get new" do
    get new_publicacion_path
    assert_response :success
  end

  it "must create publicacion" do
    assert_difference('Publicacion.count') do
      post(
        publicaciones_path,
        params: {
          publicacion: {
            titulo: "Cien años de soledad",
            texto: "Muchos años después, frente al pelotó de fusilamiento, el coronel...",
            nombre_autor: "Gabriel García Márquez",
            tipo_id: tipos_publicaciones(:novela).id
          }
        }
      )
    end

    publicacion = Publicacion.last
    assert_redirected_to autor_publicacion_path(publicacion.autor.nombre.parameterize, publicacion.titulo.parameterize)
  end

  it "must show publicacion" do
    get publicacion_path(@publicacion), params: { autor_id: @publicacion.autor }
    assert_response :success
  end

  it "must get edit" do
    get edit_publicacion_path(@publicacion)
    assert_response :success
  end

  it "must update publicacion" do
    put(
      publicacion_path(@publicacion),
      params: {
        publicacion: {
          titulo: "El Ingenioso Hidalgo Don Quijote de La Mancha",
          texto: "En un lugar de La Mancha de cuyo nombre no quiero acordarme...",
          autor_id: autores(:cervantes).id,
          tipo_id: tipos_publicaciones(:novela).id
        }
      }
    )
    assert_redirected_to publicacion_path(@publicacion.titulo.parameterize)
  end

  it "must destroy publicacion" do
    assert_difference('Publicacion.count', -1) do
      delete publicacion_path(@publicacion)
    end

    assert_redirected_to publicaciones_path
  end

end
