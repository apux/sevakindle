class CuentosController < ApplicationController
  # GET /cuentos
  def index
    @cuentos = Publicacion.cuentos
  end
end
