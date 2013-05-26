require 'nokogiri'

class ParseadorHtml
  def initialize(input)
    @doc = Nokogiri::HTML(input)
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

  #=======================
  private
  #=======================

  def extraer_titulo
    contenido_seccion_titulo.first
  end

  def extraer_autor
    contenido_seccion_titulo.last
  end

  def contenido_seccion_titulo
    @contenido_seccion_titulo ||= extraer_seccion_titulo
  end

  def extraer_seccion_titulo
    nodos = @nodo_titulo.parent.children
    nodos.map { |nodo| cadena_seccion_titulo(nodo) }.flatten.compact
  end

  def extraer_texto
    nodo = @nodo_titulo.ancestors('tr').first.next.css('table tr td')
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

class ContenidoNodo

  def texto nodo
    convertir_guiones(limpiar_cadena(texto_en_bruto(nodo)))
  end

  #========================
  private
  #========================

  def texto_en_bruto nodo
    if nodo.children.empty?
      texto_elemento_unico(nodo)
    else
      texto_elemento_con_hijos(nodo)
    end
  end

  def texto_elemento_unico(nodo)
    if nodo_text?(nodo)
      nodo.text.blank? ? nil : nodo.text
    elsif nodo_element?(nodo)
      "\n" if nodo.name == 'br'
    end
  end

  def texto_elemento_con_hijos(nodo)
    str = texto_hijos(nodo)
    nodo_parrafo?(nodo) ? agregar_salto_de_linea(str) : str
  end

  def nodo_parrafo?(nodo)
    nodo_element?(nodo) and (nodo.name == 'p' || nodo.name == 'font')
  end

  def nodo_element?(nodo)
    nodo.kind_of?(Nokogiri::XML::Element)
  end

  def nodo_text?(nodo)
    nodo.kind_of?(Nokogiri::XML::Text)
  end

  def texto_hijos(nodo)
    nodo.children.map{|nodo_hijo| texto_en_bruto(nodo_hijo) }.join
  end

  def agregar_salto_de_linea(str)
    str = str[0..-3] if str[-2..-1] == "\r\n"
    str[-1] == "\n" ? str : str + "\n"
  end

  def limpiar_cadena(str)
    return '' if str.blank?
    str.gsub(/ ?\r\n/, ' ').gsub(/(\n\n ?)|( \n)/, "\n").squeeze(' ')
  end

  def convertir_guiones(str)
    return '' if str.blank?
    str.gsub(/^-/, '—').gsub(/ -/, ' —').gsub(/-([.,;: ])/, '—\1')
  end

end
