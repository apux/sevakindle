require "test_helper"

describe Publicacion do
  before do
    @publicacion = Publicacion.new titulo: 'aaa', texto: 'bbb'
  end

  it "must be valid" do
    @publicacion.valid?.must_equal true
  end

  describe 'scopes' do
    describe '.cuentos' do
      it "returns a publicacion with tipo_publicacion 'Cuento'" do
        tipo_publicacion = TipoPublicacion.new nombre: 'Cuento'
        tipo_publicacion.save!
        publicacion = Publicacion.new titulo: 'aaa', texto: 'bbb', tipo: tipo_publicacion
        publicacion.save!

        Publicacion.cuentos.count.must_equal 1
      end

      it "does not return any publicacion with tipo_publicacion different than 'Cuento'" do
        tipo_publicacion = TipoPublicacion.new nombre: 'Ensayo'
        tipo_publicacion.save!
        publicacion = Publicacion.new titulo: 'aaa', texto: 'bbb', tipo: tipo_publicacion
        publicacion.save!

        Publicacion.cuentos.count.must_equal 0
      end
    end
  end
end
