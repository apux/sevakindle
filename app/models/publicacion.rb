require 'open-uri'

class Publicacion < ActiveRecord::Base
  attr_accessor :leer_de_url, :nombre_autor
  include FriendlyId
  friendly_id :titulo, :use => :slugged

  # == Associations ==
  belongs_to :autor
  belongs_to :tipo, class_name: 'TipoPublicacion'

  # == Validations ==
  validates :titulo, :texto, presence: true

  # == Scopes ==
  scope :cuentos, -> { joins(:tipo).where("tipos_publicaciones.nombre" => 'Cuento') }

  # == Callbacks ==
  before_validation :obtener_de_url, if: :leer_de_url?
  before_validation :obtener_autor_de_nombre, unless: :leer_de_url?
  before_validation :formatear_texto

  # == Methods ==

  def nombre_autor
    @nombre_autor ||= autor.to_s
  end

private

  def leer_de_url?
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(leer_de_url)
  end

  def obtener_de_url
    self.url_original.strip!
    self.titulo = parseador.titulo
    self.texto  = parseador.texto
    self.autor  = find_or_create_autor(parseador.autor)
  end

  def obtener_autor_de_nombre
    self.autor = find_or_create_autor(nombre_autor)
  end

  def find_or_create_autor(nombre)
    Autor.where(nombre: nombre).first_or_create
  end

  def formatear_texto
    self.texto = FormateadorCadenaSimple.formatear(texto)
  end

  def parseador
    @parseador ||= ParseadorHtml.new(html_file)
  end

  def html_file
    Nokogiri::HTML(open(url_original))
  end

end
