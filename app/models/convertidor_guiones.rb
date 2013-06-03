# Clase responsable de convertir los guiones cortos en guinoes largos según
# las reglas ortográficas en Español.
class ConvertidorGuiones

  # Convierte los guiones cortos en guiones largos.
  #
  # str - La cadena con guiones a convertir.
  #
  # Ejemplos
  #
  #     ConvertidorGuiones.convertir("-Oh, gracias. Muchas gracias por sus palabras -murmuró Jacqueline.")
  #     # => "—Oh, gracias. Muchas gracias por sus palabras —murmuró Jacqueline."
  #
  #     ConvertidorGuiones.convertir("-Somos muchos de familia -terció Agostino- y trabajamos todos.")
  #     # => "—Somos muchos de familia —terció Agostino— y trabajamos todos."
  #
  #     ConvertidorGuiones.convertir("-Seguro que, a la larga -replicó Carlota con decisión-, todo se arreglará.")
  #     # => "—Seguro que, a la larga —replicó Carlota con decisión—, todo se arreglará."
  #
  #     ConvertidorGuiones.convertir("-¡Sophie, vuelve! -insistía Stingo-. He de hablar contigo ahora mismo.")
  #     # => "—¡Sophie, vuelve! —insistía Stingo—. He de hablar contigo ahora mismo."
  #
  #     ConvertidorGuiones.convertir("-Con lo que me hubiera gustado escribir... -susurró-. Poesía. Ensayo. Una buena novela.")
  #     # => "—Con lo que me hubiera gustado escribir... —susurró—. Poesía. Ensayo. Una buena novela."
  #
  #     ConvertidorGuiones.convertir("-Ya sé en qué está pensando -dijo la propietaria-: en el color rojo. Todos hacen lo mismo.")
  #     # => "—Ya sé en qué está pensando —dijo la propietaria—: en el color rojo. Todos hacen lo mismo."
  #
  #     ConvertidorGuiones.convertir("-El hombre-gato voló por los aires -dijo el querido-de-deux-, y luego rió.")
  #     # => "—El hombre-gato voló por los aires —dijo el querido-de-deux—, y luego rió."
  #
  # Retorna una cadena con los guiones convertidos.
  def self.convertir(str)
    return '' if str.blank?
    str.gsub(/(?<=^|\W)-|-(?=\W)/, '—')
  end
end
