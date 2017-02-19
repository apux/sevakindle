require "test_helper"

describe V3::ParseadorHtml do

  def resultado_de(nombre)
    File.read(Rails.root.to_s + "/test/fixtures/#{nombre}.procesado.txt")
  end

  def original_de(nombre)
    File.open(Rails.root.to_s + "/test/fixtures/#{nombre}.original.html")
  end

  describe "La muerte tiene permiso" do
    before do
      file = original_de("la-muerte-tiene-permiso")
      html = Nokogiri::HTML(file, nil, 'UTF8')
      @parseador = V3::ParseadorHtml.new(html)
    end

    it "extract the autor" do
      @parseador.autor.must_equal "Edmundo Valadés"
    end

    it "extract the title" do
      @parseador.titulo.must_equal "La muerte tiene permiso"
    end

    it "extract the text" do
      @parseador.texto.must_equal resultado_de("la-muerte-tiene-permiso")
    end
  end # describe La muerte tiene permiso

  describe "Último beso" do
    before do
      file = original_de("ultimo-beso")
      html = Nokogiri::HTML(file, nil, 'UTF8')
      @parseador = V3::ParseadorHtml.new(html)
    end

    it "extract the autor" do
      @parseador.autor.must_equal "F. Scott Fitzgerald"
    end

    it "extract the title" do
      @parseador.titulo.must_equal "Último beso"
    end

    it "extract the texto" do
      @parseador.texto.must_equal resultado_de("ultimo-beso")
    end
  end # describe Último beso

  describe "La dicha de vivir" do
    before do
      file = original_de("la-dicha-de-vivir")
      html = Nokogiri::HTML(file, nil, 'windows-1252')
      @parseador = V3::ParseadorHtml.new(html)
    end

    it "extract the autor" do
      @parseador.autor.must_equal "Leopoldo Lugones"
    end

    it "extract the title" do
      @parseador.titulo.must_equal "La dicha de vivir"
    end

    it "extract the text" do
      @parseador.texto.must_equal resultado_de("la-dicha-de-vivir")
    end
  end # describe La dicha de vivir

  describe "Los conejos blancos" do
    before do
      file = original_de("los-conejos-blancos")
      html = Nokogiri::HTML(file, nil, 'windows-1252')
      @parseador = V3::ParseadorHtml.new(html)
    end

    it "extract the autor" do
      @parseador.autor.must_equal "Leonora Carrington"
    end

    it "extract the title" do
      @parseador.titulo.must_equal "Los conejos blancos"
    end

    it "extract the text" do
      @parseador.texto.must_equal resultado_de("los-conejos-blancos")
    end
  end # describe Los conejos blancos

end
