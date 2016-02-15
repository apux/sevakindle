class FormateadorCadenaSimple
  class << self
    # Formatea una cadena para que se muestre correctamente con `simple_format`.
    #
    # 1 Elimina los saltos duplicados que tenga la cadena
    # 2 Elimina la palabra FIN (si existe) y deja un solo salto de línea al
    #   final de la cadena
    # 3 Convierte guiones cortos en guiones largos para diálogos y
    #   parentéticos.
    #
    # Ejemplos:
    #
    #     Ver la documentación de los métodos específicos.
    #
    # Retorna una cadena formateada.
    def formatear(str)
      convertir_guiones(
        eliminar_fin(
          eliminar_saltos_duplicados(
            limpiar_espacios(str)
          )
        )
      )
    end

    # Elimina los saltos de línea duplicados en una cadena y deja sólo dos
    # saltos consecutivos ya que para el `simple_format` los dos saltos
    # representan la separación del párrafo.
    # 
    # str - La cadena a limpiar.
    #
    # Ejemplos:
    #
    #     FormateadorCadenaSimple.eliminar_saltos_duplicados("Hola\n\nmundo\n\n\n\ncruel\n\n\n\n")
    #     # => "Hola\n\nmundo\n\ncruel\n\n"
    #
    # Retorna una cadena sin saltos duplicados.
    def eliminar_saltos_duplicados(str)
      str.gsub(/(\n+ ?)|( \n+)/, "\n\n")
    end

    # Elimina la palabra FIN y el último salto de línea.
    #
    # str - La cadena a procesar.
    #
    # Ejemplos:
    #
    #     FormateadorCadenaSimple.eliminar_fin("Hola\n\nmundo\n\ncruel\n\n")
    #     # => "Hola\n\nmundo\n\ncruel\n"
    #
    #     FormateadorCadenaSimple.eliminar_fin("Hola\n\nmundo\n\ncruel\n\nFIN\n\n")
    #     # => resultado = "Hola\n\nmundo\n\ncruel\n"
    def eliminar_fin(str)
      str.gsub(/FIN\n\n\z/, "").chomp
    end

    # Convierte los guiones cortos en guiones largos.
    #
    # str - La cadena con guiones a convertir.
    #
    # Ejemplos
    #
    #     FormateadorCadenaSimple.convertir("-Oh, gracias. Muchas gracias por sus palabras -murmuró Jacqueline.")
    #     # => "—Oh, gracias. Muchas gracias por sus palabras —murmuró Jacqueline."
    #
    #     FormateadorCadenaSimple.convertir("-Somos muchos de familia -terció Agostino- y trabajamos todos.")
    #     # => "—Somos muchos de familia —terció Agostino— y trabajamos todos."
    #
    #     FormateadorCadenaSimple.convertir("-Seguro que, a la larga -replicó Carlota con decisión-, todo se arreglará.")
    #     # => "—Seguro que, a la larga —replicó Carlota con decisión—, todo se arreglará."
    #
    #     FormateadorCadenaSimple.convertir("-¡Sophie, vuelve! -insistía Stingo-. He de hablar contigo ahora mismo.")
    #     # => "—¡Sophie, vuelve! —insistía Stingo—. He de hablar contigo ahora mismo."
    #
    #     FormateadorCadenaSimple.convertir("-Con lo que me hubiera gustado escribir... -susurró-. Poesía. Ensayo. Una buena novela.")
    #     # => "—Con lo que me hubiera gustado escribir... —susurró—. Poesía. Ensayo. Una buena novela."
    #
    #     FormateadorCadenaSimple.convertir("-Ya sé en qué está pensando -dijo la propietaria-: en el color rojo. Todos hacen lo mismo.")
    #     # => "—Ya sé en qué está pensando —dijo la propietaria—: en el color rojo. Todos hacen lo mismo."
    #
    #     FormateadorCadenaSimple.convertir("-El hombre-gato voló por los aires -dijo el querido-de-deux-, y luego rió.")
    #     # => "—El hombre-gato voló por los aires —dijo el querido-de-deux—, y luego rió."
    #
    # Retorna una cadena con los guiones convertidos.
    def convertir_guiones(str)
      str.gsub(/(?<=^|\W)-|-(?=\W)/, '—')
    end

    # Convierte los espacios generados por &npbs; a espacios normales y elimina
    # espacios duplicados.
    #
    # str - La cadena con espacios
    #
    # Ejemplos
    #
    #     FormateadorCadenaSimple.limiar_espacios("Hola mundo")
    #     # => "Hola mundo"
    #
    #     FormateadorCadenaSimple.limiar_espacios("Hola   mundo")
    #     # => "Hola mundo"
    #
    #     FormateadorCadenaSimple.limiar_espacios("Hola " << 160 << " mundo")
    #     # => "Hola mundo"
    def limpiar_espacios(str)
      str.gsub("" << 160, ' ').squeeze(' ')
    end
  end
end
