require 'test_helper'

describe ContenidoNodo do
  describe '#texto' do
    it 'devuelve \n si el nodo es un elemento br' do
      nodo = Nokogiri.HTML('hola<br />mundo')
      _(ContenidoNodo.new.texto(nodo)).must_equal "hola\n\nmundo\n\n"
    end

    it 'devuelve el texto de un unico elemento de párrafo' do
      nodo = Nokogiri.HTML('<p>Hola mundo</p>')
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola mundo\n\n"
    end

    it 'devuelve el texto de un unico elemento de fuente' do
      nodo = Nokogiri.HTML('<font>Hola mundo</font>')
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola mundo\n\n"
    end

    it 'devuelve el texto de un nodo fuente con brs' do
      str = %{
<font>Hola   \r\n mundo<br>\r\n
<br>\r\n
    cruel
</font>
      }
      nodo = Nokogiri.HTML(str)
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola mundo\n\n\n\ncruel\n\n"
    end

    it 'devuelve el texto de un nodo parrafo con brs' do
      str = %{
<p>Hola
mundo
<br>
cruel
</p>
      }
      nodo = Nokogiri.HTML(str)
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola mundo\n\ncruel\n\n"
    end

    it 'devuelve el texto de un nodo parrafo con fuente y con brs' do
      str = %{
<p>
<font>
Hola
<br>\r\n
 mundo
</font>
</p>
      }
      nodo = Nokogiri.HTML(str)
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola\n\nmundo\n\n\n\n"
    end

    it 'devuelve el texto con un nodo fuente seguido de un un nodo parrafo con un nodo fuente anidado' do
      nodo = Nokogiri.HTML(
       %{
<font>Hola</font>
</p><font><p>mundo</p>
<br>
cruel</font>
       }
      )
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola\n\nmundo\n\n\n\ncruel\n\n"
    end

    it 'devuelve el texto con formato cursivas si un nodo indica ese formato' do
      nodo = Nokogiri.HTML('<font>Hola <i>mundo</i></font>')
      _(ContenidoNodo.new.texto(nodo)).must_equal "Hola <em>mundo</em>\n\n"
    end
  end
end
