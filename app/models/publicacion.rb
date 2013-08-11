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

  #======================
  private
  #======================

  def leer_de_url?
    leer_de_url.present?
  end

  def get_from_url
    return if self.url_original.blank? or self.texto.present?
    self.url_original.strip!
    parseador = ParseadorHtml.new(html_file)
    self.titulo = parseador.titulo
    self.autor = get_autor(parseador.autor)
    self.texto = parseador.texto
  end

  def get_autor(nombre)
    Autor.where(nombre: nombre).first_or_create
  end

  def set_autor
    self.autor = get_autor(nombre_autor)
  end

  def convertir_guiones
    self.texto = ConvertidorGuiones.convertir(self.texto)
  end

  def html_file
    require 'open-uri'
    open(self.url_original)
  end
end
