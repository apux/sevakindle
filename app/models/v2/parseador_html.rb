module V2

  class ParseadorHtml
    def initialize(input)
      @doc = input
      @nodo_titulo = @doc.css('.container > .col-white > .text-center').first
    end

    def titulo
      contenido_seccion_titulo.first
    end

    def autor
      contenido_seccion_titulo.last
    end

    def texto
      @texto ||= extraer_texto
    end

  private

    def contenido_seccion_titulo
      @contenido_seccion_titulo ||= extraer_seccion_titulo
    end

    def extraer_seccion_titulo
      @nodo_titulo.children.map {|c| c.text }
    end

    def extraer_texto
      nodo = @doc.css('.container > .col-white > .text-justify').first
      texto = ContenidoNodo.new.texto(nodo)
      FormateadorCadenaSimple.formatear(texto)
    end
  end

end
