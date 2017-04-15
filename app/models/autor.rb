class Autor < ActiveRecord::Base
  include FriendlyId
  friendly_id :nombre, use: :slugged

  # == Associations ==
  has_many :publicaciones

  # == Validations ==
  validates :nombre, presence: true
  validates :nombre, uniqueness: true

  # == Methods ==

  def to_s
    nombre
  end
end
