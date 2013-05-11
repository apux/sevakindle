require "test_helper"

describe Publicacion do
  before do
    @publicacion = Publicacion.new titulo: 'aaa', texto: 'bbb'
  end

  it "must be valid" do
    @publicacion.valid?.must_equal true
  end

  describe 'assign an url' do
    describe '' do
    end
  end
end
