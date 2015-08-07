class ParseadorHtml
  def initialize(input)
    @doc = input
    @nodo_titulo = @doc.css('center > table > tr > td > font').first
  end

  def titulo
    @titulo ||= extraer_titulo
  end

  def autor
    @autor ||= extraer_autor
  end

  def texto
    @texto ||= extraer_texto
  end

private

  def extraer_titulo
    contenido_seccion_titulo.first
  end

  def extraer_autor
    contenido_seccion_titulo.last
  end

  def contenido_seccion_titulo
    @contenido_seccion_titulo ||= extraer_seccion_titulo
  end

  # Extrae las cadenas de la seccion de titulo. Esta seccion generalmente se
  # compone de tres elementos: el titulo de la publicacion, una nota, y el
  # nombre del autor.
  #
  # La estructura HTML que recibe puede contener tres nodos, cada uno con un
  # dato, o bien, un nodo con informacion anidada. Por ejemplo:
  #
  #     <font>Titulo</font>
  #     <font>Nota</font>
  #     <font>Nombre del autor</font>
  #
  #     <font>
  #       <font>Titulo</font>
  #       <font>Nota<font>
  #     </font>
  #     <font>Nombre del autor</font>
  #
  #
  #     extraer_seccion_titulo     # => ['Titulo', 'Nota', 'Nombre del autor']
  #
  # Retorna un arreglo de dos o tres elementos, donde el primero es el titulo
  #         de la publicacion y el ultimo el nombre del autor.
  def extraer_seccion_titulo
    nodos = @nodo_titulo.parent.children
    nodos.map { |nodo| cadena_seccion_titulo(nodo) }.flatten.compact
  end

  def extraer_texto
    nodo = @nodo_titulo.ancestors('tr').first.next_element.css('table tr td')
    ContenidoNodo.new.texto(nodo)
  end

  def cadena_seccion_titulo(nodo)
    # multiples parrafos?
    if nodos = nodo.css('font') and nodos.count > 0

      # se extrae el contenido de cada parrafo interno
      nodos.map { |interno| interno.text.strip unless interno.text.blank? }
    else
      nodo.text.strip unless nodo.text.blank?
    end
  end

end
