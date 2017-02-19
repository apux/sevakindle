module V3

  class ParseadorHtml
    def initialize(input)
      @doc = input
      @nodo_titulo = @doc.css(base_css + " > header > .text-center").first
    end

    def titulo
      contenido_seccion_titulo.first
    end

    def autor
      contenido_seccion_titulo.last.strip
    end

    def texto
      @texto ||= extraer_texto
    end

  private

    def contenido_seccion_titulo
      @contenido_seccion_titulo ||= extraer_seccion_titulo
    end

    def extraer_seccion_titulo
      @nodo_titulo.children.map {|c| c.text if c.text.present? }.compact
    end

    def extraer_texto
      nodo = @doc.css(base_css + " > .text-justify").first
      texto = ContenidoNodo.new.texto(nodo)
      FormateadorCadenaSimple.formatear(texto)
    end

    def base_css
      ".container-fluid > .col-white > article"
    end
  end

end
