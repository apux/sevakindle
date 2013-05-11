class Autor < ActiveRecord::Base
  # == Associations ==
  has_many :publicaciones

  # == Validations ==
  validates :nombre, presence: true

  # == Methods ==

  def to_s
    self.nombre
  end
end
