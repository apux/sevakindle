require 'test_helper'

describe ConvertidorGuiones do
  describe '.convertir' do

    it 'convierte guiones al inicio de la oración e intermedio al incio de una palabra' do
      str = ConvertidorGuiones.convertir("-Oh, gracias. Muchas gracias por sus palabras -murmuró Jacqueline.")
      str.must_equal "—Oh, gracias. Muchas gracias por sus palabras —murmuró Jacqueline."
    end

    it 'convierte guiones al inicio de la oración e intermedio al final de una palabra' do
      str = ConvertidorGuiones.convertir("-Somos muchos de familia -terció Agostino- y trabajamos todos.")
      str.must_equal "—Somos muchos de familia —terció Agostino— y trabajamos todos."
    end

    it 'convierte guiones al inicio de la oración e intermedio al inicio de una palbra y al final de una palabra seguida de una coma' do
      str = ConvertidorGuiones.convertir("-Seguro que, a la larga -replicó Carlota con decisión-, todo se arreglará.")
      str.must_equal "—Seguro que, a la larga —replicó Carlota con decisión—, todo se arreglará."
    end

    it 'convierte guiones al inicio de la oración con signo de admiración e intermedio al inicio de una palbra y al final de una palabra seguida de un punto' do
      str = ConvertidorGuiones.convertir("-¡Sophie, vuelve! -insistía Stingo-. He de hablar contigo ahora mismo.")
      str.must_equal "—¡Sophie, vuelve! —insistía Stingo—. He de hablar contigo ahora mismo."
    end

    it 'convierte los guiones que encierran una palabra' do
      str = ConvertidorGuiones.convertir("-Con lo que me hubiera gustado escribir... -susurró-. Poesía. Ensayo. Una buena novela.")
      str.must_equal "—Con lo que me hubiera gustado escribir... —susurró—. Poesía. Ensayo. Una buena novela."
    end

    it 'convierte el guión al final de una palabra seguida de dos puntos' do
      str = ConvertidorGuiones.convertir("-Ya sé en qué está pensando -dijo la propietaria-: en el color rojo. Todos hacen lo mismo.")
      str.must_equal "—Ya sé en qué está pensando —dijo la propietaria—: en el color rojo. Todos hacen lo mismo."
    end

    it 'no convierte los guiones que separan palabras' do
      str = ConvertidorGuiones.convertir("-El hombre-gato voló por los aires -dijo el querido-de-deux-, y luego rió.")
      str.must_equal "—El hombre-gato voló por los aires —dijo el querido-de-deux—, y luego rió."
    end
  end # describe .convertir
end
