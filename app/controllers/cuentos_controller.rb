class CuentosController < ApplicationController
  # GET /cuentos
  def index
    @cuentos = Publicacion.cuentos.all
  end
end
