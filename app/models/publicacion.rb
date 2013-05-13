class Publicacion < ActiveRecord::Base
  # == Associations ==
  belongs_to :autor
  belongs_to :tipo, class_name: 'TipoPublicacion'

  # == Validations ==
  validates :titulo, :texto, presence: true

  # == Scopes ==
  scope :cuentos, -> { joins(:tipo).where("tipos_publicaciones.nombre" => 'Cuento') }

  # == Callbacks ==
  before_validation :get_from_url

  # == Methods ==

  #======================
  private
  #======================

  def get_from_url
    return if self.url_original.blank? or self.texto.present?

    require 'open-uri'
    parseador = ParseadorHtml.new(open(self.url_original))
    self.titulo = parseador.titulo
    self.autor = Autor.where(nombre: parseador.autor).first_or_create
    self.texto = parseador.texto
  end

end
