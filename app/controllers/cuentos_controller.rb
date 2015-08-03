class CuentosController < ApplicationController
  # GET /cuentos
  def index
    @cuentos = Publicacion.cuentos.includes(:autor)
  end
end
