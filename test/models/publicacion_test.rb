require "test_helper"

describe Publicacion do
  before do
    tipo = TipoPublicacion.new nombre: "cuento"
    @publicacion = Publicacion.new titulo: 'aaa', texto: 'bbb', tipo: tipo
  end

  it "must be valid" do
    assert @publicacion.valid?
  end

  describe 'scopes' do
    describe '.cuentos' do
      it "returns a publicacion with tipo_publicacion 'Cuento'" do
        tipo_publicacion = TipoPublicacion.create nombre: 'Cuento'
        publicacion = Publicacion.create titulo: 'aaa', texto: 'bbb', tipo: tipo_publicacion
        Publicacion.cuentos.count.must_equal 1
      end

      it "does not return any publicacion with tipo_publicacion different than 'Cuento'" do
        tipo_publicacion = TipoPublicacion.create nombre: 'Ensayo'
        publicacion = Publicacion.create titulo: 'aaa', texto: 'bbb', tipo: tipo_publicacion
        Publicacion.cuentos.count.must_equal 0
      end
    end
  end
end
