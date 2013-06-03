# Clase responsable de extraer el contenido de una estructura html. Recibe un
# nodo nokogiri y lo procesa. Si el nodo es de un único elemento, regresa su
# contenido, si es de varios elementos, por medio de recursividad, regresa
# el texto de todos los elementos hijos.
class ContenidoNodo

  def texto nodo
    limpiar_y_convertir_guiones texto_en_bruto(nodo)
  end

  #========================
  private
  #========================

  def texto_en_bruto nodo
    nodo.extend(AdditionalNodeMethods)
    if nodo.has_no_children?
      texto_elemento_unico(nodo)
    else
      texto_elemento_con_hijos(nodo)
    end
  end

  def texto_elemento_unico(nodo)
    if nodo.text?
      nodo.text.blank? ? '' : eliminar_saltos(nodo.text)
    elsif nodo.br?
      "\n"
    end
  end

  def texto_elemento_con_hijos(nodo)
    str = texto_hijos(nodo)
    if nodo.paragraph?
      agregar_salto_de_linea(str)
    elsif nodo.i?
      str.strip
    else
      str
    end
  end

  def texto_hijos(nodo)
    nodo.children.map{|nodo_hijo| texto_en_bruto(nodo_hijo) }.join
  end

  def agregar_salto_de_linea(str)
    return '' if str.blank?
    str.gsub(/(^ )|( $)/, '') + "\n"
  end

  def limpiar_y_convertir_guiones str
    limpiar_saltos_duplicados(convertir_guiones(str))
  end

  def limpiar_saltos_duplicados(str)
    return '' if str.blank?
    str.gsub(/(\n+ ?)|( \n+)/, "\n")
  end

  def convertir_guiones(str)
    ConvertidorGuiones.convertir(str)
  end

  def eliminar_saltos(str)
    str.gsub(/ ?\r?\n/, ' ').squeeze(' ')
  end

end

module AdditionalNodeMethods
  def i?; element? and name == 'i'; end
  def text?; kind_of?(Nokogiri::XML::Text); end
  def element?; kind_of?(Nokogiri::XML::Element); end
  def paragraph?; element? and (name == 'p' or name == 'font'); end
  def br?; element? and name == 'br'; end
  def has_no_children?; children.empty?; end
end

