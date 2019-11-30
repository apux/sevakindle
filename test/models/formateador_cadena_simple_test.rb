require 'test_helper'

describe FormateadorCadenaSimple do
  describe '.eliminar_saltos_duplicados' do
    it 'regresa la misma cadena si no tiene saltos duplicados' do
      str = "hola\n\nmundo\n\n"
      resultado = "hola\n\nmundo\n\n"
      _(FormateadorCadenaSimple.eliminar_saltos_duplicados(str)).must_equal(resultado)
    end

    it 'regresa la misma cadena sin saltos duplicados' do
      str = "Hola\n\nmundo\n\n\n\ncruel\n\n\n\n"
      resultado = "Hola\n\nmundo\n\ncruel\n\n"
      _(FormateadorCadenaSimple.eliminar_saltos_duplicados(str)).must_equal(resultado)
    end
  end # describe .eliminar_saltos_duplicados

  describe '.eliminar_fin' do
    it 'elimina el enter final' do
      str = "Hola\n\nmundo\n\ncruel\n\n"
      resultado = "Hola\n\nmundo\n\ncruel\n"
      _(FormateadorCadenaSimple.eliminar_fin(str)).must_equal(resultado)
    end

    it 'elimina la palabra FIN del final' do
      str = "Hola\n\nmundo\n\ncruel\n\nFIN\n\n"
      resultado = "Hola\n\nmundo\n\ncruel\n"
      _(FormateadorCadenaSimple.eliminar_fin(str)).must_equal(resultado)
    end
  end # describe .eliminar_fin

  describe '.convertir_guiones' do
    it 'convierte guiones al inicio de la oración e intermedio al incio de una palabra' do
      str = FormateadorCadenaSimple.convertir_guiones("-Oh, gracias. Muchas gracias por sus palabras -murmuró Jacqueline.")
      _(str).must_equal "—Oh, gracias. Muchas gracias por sus palabras —murmuró Jacqueline."
    end

    it 'convierte guiones al inicio de la oración e intermedio al final de una palabra' do
      str = FormateadorCadenaSimple.convertir_guiones("-Somos muchos de familia -terció Agostino- y trabajamos todos.")
      _(str).must_equal "—Somos muchos de familia —terció Agostino— y trabajamos todos."
    end

    it 'convierte guiones al inicio de la oración e intermedio al inicio de una palbra y al final de una palabra seguida de una coma' do
      str = FormateadorCadenaSimple.convertir_guiones("-Seguro que, a la larga -replicó Carlota con decisión-, todo se arreglará.")
      _(str).must_equal "—Seguro que, a la larga —replicó Carlota con decisión—, todo se arreglará."
    end

    it 'convierte guiones al inicio de la oración con signo de admiración e intermedio al inicio de una palbra y al final de una palabra seguida de un punto' do
      str = FormateadorCadenaSimple.convertir_guiones("-¡Sophie, vuelve! -insistía Stingo-. He de hablar contigo ahora mismo.")
      _(str).must_equal "—¡Sophie, vuelve! —insistía Stingo—. He de hablar contigo ahora mismo."
    end

    it 'convierte los guiones que encierran una palabra' do
      str = FormateadorCadenaSimple.convertir_guiones("-Con lo que me hubiera gustado escribir... -susurró-. Poesía. Ensayo. Una buena novela.")
      _(str).must_equal "—Con lo que me hubiera gustado escribir... —susurró—. Poesía. Ensayo. Una buena novela."
    end

    it 'convierte el guión al final de una palabra seguida de dos puntos' do
      str = FormateadorCadenaSimple.convertir_guiones("-Ya sé en qué está pensando -dijo la propietaria-: en el color rojo. Todos hacen lo mismo.")
      _(str).must_equal "—Ya sé en qué está pensando —dijo la propietaria—: en el color rojo. Todos hacen lo mismo."
    end

    it 'no convierte los guiones que separan palabras' do
      str = FormateadorCadenaSimple.convertir_guiones("-El hombre-gato voló por los aires -dijo el querido-de-deux-, y luego rió.")
      _(str).must_equal "—El hombre-gato voló por los aires —dijo el querido-de-deux—, y luego rió."
    end
  end # describe .convertir_guiones

  describe '#convertir_espacios' do
    it 'regresa la misma cadena si no tiene espacios &nbsp;' do
      str = "hola mundo"
      resultado = "hola mundo"
      _(FormateadorCadenaSimple.limpiar_espacios(str)).must_equal(resultado)
    end

    it 'regresa la cadena con espacios en lugar de &nbsp;' do
      str = "hola" << 160 << "mundo"
      resultado = "hola mundo"
      _(FormateadorCadenaSimple.limpiar_espacios(str)).must_equal(resultado)
    end

    it 'regresa la cadena sin espacios duplicados en lugar' do
      str = "hola " << 160 << " mundo"
      resultado = "hola mundo"
      _(FormateadorCadenaSimple.limpiar_espacios(str)).must_equal(resultado)
    end

  end # describe #convertir_espacios

end
