# Clase responsable de extraer el contenido de una estructura html. Recibe un
# nodo nokogiri y lo procesa. Si el nodo es de un único elemento, regresa su
# contenido, si es de varios elementos, por medio de recursividad, regresa
# el texto de todos los elementos hijos.
class ContenidoNodo

  def texto(nodo)
    nodo.extend(AdditionalNodeMethods)
    if nodo.has_children?
      texto_elemento_con_hijos(nodo)
    else
      texto_elemento_unico(nodo)
    end
  end

private

  def texto_elemento_unico(nodo)
    if nodo.text?
      nodo.text.blank? ? nodo.text == " " ? " " : "" : eliminar_saltos(nodo.text)
    elsif nodo.br?
      "\n\n"
    end
  end

  def texto_elemento_con_hijos(nodo)
    str = texto_hijos(nodo)
    if nodo.paragraph?
      agregar_salto_de_linea(str)
    elsif nodo.i?
      str.end_with?(" ") ?  "<em>#{str.strip}</em> " : "<em>#{str.strip}</em>"
    else
      str
    end
  end

  def texto_hijos(nodo)
    nodo.children.map{|nodo_hijo| texto(nodo_hijo) }.join
  end

  def agregar_salto_de_linea(str)
    return str if str.blank?
    str.gsub(/(^ )|( $)/, "") + "\n\n"
  end

  def eliminar_saltos(str)
    str.gsub(/ ?\r?\n/, " ").squeeze(" ")
  end
end

module AdditionalNodeMethods
  def i?; element? and name == "i"; end
  def text?; kind_of?(Nokogiri::XML::Text); end
  def element?; kind_of?(Nokogiri::XML::Element); end
  def paragraph?; element? and (name == "p" or name == "font" or name == "div"); end
  def br?; element? and name == "br"; end
  def has_children?; !children.empty?; end
end
