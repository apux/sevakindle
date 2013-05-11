class Publicacion < ActiveRecord::Base
  # == Associations ==
  belongs_to :autor
  belongs_to :tipo, class_name: 'TipoPublicacion'

  # == Validations ==
  validates :titulo, :texto, presence: true

  # == Callbacks ==
  before_validation :get_from_url, :convert_dashes

  # == Methods ==

  #======================
  private
  #======================

  def get_from_url
    return if self.url_original.blank? or !self.texto.blank?
    require 'open-uri'
    parseador = ParseadorHtml.new(open(self.url_original))

    self.titulo = parseador.titulo
    self.autor = Autor.where(nombre: parseador.autor).first_or_create
    self.texto = parseador.texto
  end

  def convert_dashes
    self.texto = texto.gsub(/^-/, '—').gsub(/ -/, ' —').gsub(/-([.,;: ])/, '—\1') unless self.texto.blank?
  end
end
