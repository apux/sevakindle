require "test_helper"

describe TipoPublicacion do
  before do
    @tipo_publicacion = TipoPublicacion.new nombre: 'aaa'
  end

  it "must be valid" do
    @tipo_publicacion.valid?.must_equal true
  end

  describe '#to_s' do
    it "must respond with its name" do
      @tipo_publicacion.to_s.must_equal 'aaa'
    end
  end
end
