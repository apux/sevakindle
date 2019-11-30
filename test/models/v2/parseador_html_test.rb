require "test_helper"

describe V2::ParseadorHtml do

  def resultado_de(nombre)
    File.read(Rails.root.to_s + "/test/fixtures/#{nombre}.procesado.txt")
  end

  def original_de(nombre)
    File.open(Rails.root.to_s + "/test/fixtures/#{nombre}.original.html")
  end

  describe "baltazar gerard" do
    before do
      file = original_de('baltasar_gerard')
      html = Nokogiri::HTML(file, nil, 'UTF8')
      @parseador = V2::ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      _(@parseador.autor).must_equal 'Juan José Arreola'
    end

    it 'extract the title' do
      _(@parseador.titulo).must_equal 'Baltasar Gérard [1555 1582]'
    end

    it 'extract the text' do
      _(@parseador.texto).must_equal resultado_de('baltasar_gerard')
    end
  end # describe baltazar gerard

  describe "amorosa" do
    before do
      file = original_de('amorosa')
      html = Nokogiri::HTML(file, nil, 'UTF8')
      @parseador = V2::ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      _(@parseador.autor).must_equal 'Guy de Maupassant'
    end

    it 'extract the title' do
      _(@parseador.titulo).must_equal 'Amorosa'
    end

    it 'extract the text' do
      _(@parseador.texto).must_equal resultado_de('amorosa')
    end
  end # describe amorosa

  describe "viaje a la semilla" do
    before do
      file = original_de('viaje_a_la_semilla')
      html = Nokogiri::HTML(file, nil, 'windows-1252')
      @parseador = V2::ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      _(@parseador.autor).must_equal 'Alejo Carpentier'
    end

    it 'extract the title' do
      _(@parseador.titulo).must_equal 'Viaje a la semilla'
    end

    it 'extract the text' do
      _(@parseador.texto).must_equal resultado_de('viaje_a_la_semilla')
    end
  end # describe viaje a la semila

  describe "el informe de brodie" do
    before do
      file = original_de('el_informe_de_brodie')
      html = Nokogiri::HTML(file, nil, 'windows-1252')
      @parseador = V2::ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      _(@parseador.autor).must_equal 'Jorge Luis Borges'
    end

    it 'extract the title' do
      _(@parseador.titulo).must_equal 'El informe de Brodie'
    end

    it 'extract the text' do
      _(@parseador.texto).must_equal resultado_de('el_informe_de_brodie')
    end
  end # describe el informe de brodie

end
