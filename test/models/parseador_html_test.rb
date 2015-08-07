require "test_helper"

describe ParseadorHtml do

  def resultado_de(nombre)
    File.read(Rails.root.to_s + "/test/fixtures/#{nombre}.txt")
  end

  def original_de(nombre)
    File.open(Rails.root.to_s + "/test/fixtures/#{nombre}.html")
  end

  describe 'wakefield' do
    before do
      file = original_de('wakefield')
      html = Nokogiri::HTML(file)
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Nathaniel Hawthorne'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Wakefield'
    end

    it 'extract the text' do
      @parseador.texto.must_equal resultado_de('wakefield')
    end
  end

  describe 'un canario de regalo' do
    before do
      file = original_de('canario')
      html = Nokogiri::HTML(file)
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Ernest Hemingway'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Un canario como regalo'
    end

    it 'extract the text' do
      @parseador.texto.must_equal resultado_de('canario')
    end
  end

  describe 'matrimonio a la moda' do
    before do
      file = original_de('matrimonio')
      html = Nokogiri::HTML(file)
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Katherine Mansfield'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Matrimonio a la moda'
    end

    it 'extract the text' do
      @parseador.texto.must_equal resultado_de('matrimonio')
    end
  end

  describe 'el rastro de tu sangre en la nieve' do
    before do
      file = original_de('el_rastro_de_tu_sangre_en_la_nieve')
      html = Nokogiri::HTML(file)
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Gabriel García Márquez'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'El rastro de tu sangre en la nieve'
    end

    it 'extract the text' do
      @parseador.texto.must_equal resultado_de('el_rastro_de_tu_sangre_en_la_nieve')
    end
  end

  describe 'arabia' do
    before do
      file = original_de('arabia')
      html = Nokogiri::HTML(file)
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'James Joyce'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Arabia'
    end

    it 'extract the text' do
      @parseador.texto.must_equal resultado_de('arabia')
    end
  end
end
