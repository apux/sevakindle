class Publicacion < ActiveRecord::Base
  attr_accessor :leer_de_url, :nombre_autor

  # == Associations ==
  belongs_to :autor
  belongs_to :tipo, class_name: 'TipoPublicacion'

  # == Validations ==
  validates :titulo, :texto, presence: true

  # == Scopes ==
  scope :cuentos, -> { joins(:tipo).where("tipos_publicaciones.nombre" => 'Cuento') }

  # == Callbacks ==
  before_validation :get_from_url, if: :leer_de_url?
  before_validation :convertir_guiones, :set_autor, unless: :leer_de_url?

  # == Methods ==

private

  def leer_de_url?
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include? leer_de_url
  end

  def get_from_url
    return if self.texto.present?

    self.url_original.strip!
    self.titulo = parseador.titulo
    self.texto  = parseador.texto
    self.autor  = find_or_create_autor(parseador.autor)
  end

  def find_or_create_autor(nombre)
    Autor.where(nombre: nombre).first_or_create
  end

  def set_autor
    self.autor = find_or_create_autor(nombre_autor)
  end

  def convertir_guiones
    self.texto = ConvertidorGuiones.convertir(self.texto)
  end

  def parseador
    @parseador ||= ParseadorHtml.new(html_file)
  end

  def html_file
    require 'open-uri'
    Nokogiri::HTML(open(url_original))
  end
end
