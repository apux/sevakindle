require 'open-uri'

class Publicacion < ActiveRecord::Base
  attr_accessor :leer_de_url, :nombre_autor

  # == Associations ==
  belongs_to :autor
  belongs_to :tipo, class_name: 'TipoPublicacion'

  # == Validations ==
  validates :titulo, :texto, presence: true
  validates :titulo, uniqueness: { scope: :autor_id }

  # == Scopes ==
  scope :cuentos, -> { joins(:tipo).where("tipos_publicaciones.nombre": "Cuento") }

  # == Callbacks ==
  before_validation :obtener_de_url, if: :leer_de_url?
  before_validation :obtener_autor_de_nombre, unless: :leer_de_url?
  before_validation :formatear_texto

  # FriendlyId executes a before_validation callback so it need to be placed
  # after our callbacks
  include FriendlyId
  friendly_id :titulo, :use => :slugged

  # == Methods ==

  def nombre_autor
    @nombre_autor ||= autor.to_s
  end

private

  def leer_de_url?
    ActiveModel::Type::Boolean.new.cast(leer_de_url)
  end

  def obtener_de_url
    self.url_original.strip!
    extract_data_from_parser
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

  def extract_data_from_parser
    success = false
    parseadores_disponibles.each do |parseador|
      begin
        self.titulo = parseador.titulo
        self.texto  = parseador.texto
        self.autor  = find_or_create_autor(parseador.autor)
        success = true
        break
      rescue
        next
      end
    end
    errors.add :base, "Ningún parseador pudo extraer correctamente los datos de la página." unless success
  end

  def html_file
    Nokogiri::HTML(open(url_original))
  end

  def parseadores_disponibles
    @parseadores_disponibles ||= [
      V3::ParseadorHtml.new(html_file),
      V2::ParseadorHtml.new(html_file),
      ParseadorHtml.new(html_file),
    ]
  end
end
