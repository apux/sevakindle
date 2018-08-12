require "test_helper"

describe AutoresController do

  before do
    @autor = autores(:cervantes)
  end

  it "must get index" do
    get autores_path
    assert_response :success
  end

  it "must get new" do
    get new_autor_path
    assert_response :success
  end

  it "must show autor" do
    get autor_path(@autor)
    assert_response :success
  end

  it "must update autor" do
    put autor_path(@autor), params: { autor: { nombre: 'Albert Camus'  } }
    assert_redirected_to autor_path(@autor.reload.nombre.parameterize)
  end

  it "must destroy autor" do
    assert_difference('Autor.count', -1) do
      delete autor_path(@autor)
    end

    assert_redirected_to autores_path
  end

end
