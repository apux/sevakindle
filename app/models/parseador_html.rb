require 'nokogiri'

class ParseadorHtml
  def initialize(input)
    @doc = Nokogiri::HTML(input)
    @title_node = @doc.css('center > table > tr > td > font').first
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
    cadenas = @title_node.parent.children.map do |t1|
      if aux = t1.css('font') and aux.count > 0
        aux.map { |t2| t2.text.strip unless t2.text.blank? }
      else
        t1.text.strip unless t1.text.blank?
      end
    end
    cadenas.flatten.compact
  end

  def extraer_texto
    texto = primera_linea
    l = @title_node.ancestors('tr').first.next.css('table tr td p font').map do |nodo|
      parrafo contenido_nodo nodo
    end
    texto += l.compact.join("\n")
  end

  def parrafo(str)
    convertir_guiones limpiar_cadena str
  end

  def limpiar_cadena(str)
    return '' if str.blank?
    str.strip.squeeze(' ').gsub(/ ?\r\n/, ' ').gsub(/\n\n ?/, "\n")
  end

  def convertir_guiones(str)
    return '' if str.blank?
    str.gsub(/^-/, '—').gsub(/ -/, ' —').gsub(/-([.,;: ])/, '—\1')
  end

  def primera_linea
    texto = ""
    nodo = @title_node.ancestors('tr').first.next.css('table tr td > font').first
    texto += parrafo(contenido_nodo(nodo)) if nodo
    texto += "\n" unless texto.blank?
    texto
  end

  def contenido_nodo nodo
    nodo.children.collect{|a1| contenido_o_salto_de_linea(a1) }.compact.join
  end

  def contenido_o_salto_de_linea nodo
    nodo.kind_of?(Nokogiri::XML::Element) && nodo.name == 'br' ? "\n" : nodo.content
  end

end
