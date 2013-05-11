require "test_helper"

describe ParseadorHtml do
  describe 'wakefield' do
    before do
      html = File.open(Rails.root.to_s + '/test/fixtures/wakefield.html')
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Nathaniel Hawthorne'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Wakefield'
    end

    it 'extract the text' do
      (@parseador.texto + "\n").must_equal File.read(Rails.root.to_s + '/test/fixtures/wakefield.txt')
    end
  end

  describe 'un canario de regalo' do
    before do
      html = File.open(Rails.root.to_s + '/test/fixtures/canario.html')
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Ernest Hemingway'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Un canario como regalo'
    end

    it 'extract the text' do
      (@parseador.texto + "\n").must_equal File.read(Rails.root.to_s + '/test/fixtures/canario.txt')
    end
  end

  describe 'matrimonio a la moda' do
    before do
      html = File.open(Rails.root.to_s + '/test/fixtures/matrimonio.html')
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Katherine Mansfield'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'Matrimonio a la moda'
    end

    it 'extract the text' do
      (@parseador.texto + "\n").must_equal File.read(Rails.root.to_s + '/test/fixtures/matrimonio.txt')
    end
  end

  describe 'el rastro de tu sangre en la nieve' do
    before do
      html = File.open(Rails.root.to_s + '/test/fixtures/el_rastro_de_tu_sangre_en_la_nieve.html')
      @parseador = ParseadorHtml.new(html)
    end

    it 'extract the autor' do
      @parseador.autor.must_equal 'Gabriel García Márquez'
    end

    it 'extract the title' do
      @parseador.titulo.must_equal 'El rastro de tu sangre en la nieve'
    end

    it 'extract the text' do
      (@parseador.texto + "\n").must_equal File.read(Rails.root.to_s + '/test/fixtures/el_rastro_de_tu_sangre_en_la_nieve.txt')
    end
  end
end
