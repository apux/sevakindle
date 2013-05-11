class TiposPublicacionesController < ApplicationController
  before_action :set_tipo_publicacion, only: [:show, :edit, :update, :destroy]

  # GET /tipos_publicaciones
  # GET /tipos_publicaciones.json
  def index
    @tipos_publicaciones = TipoPublicacion.all
  end

  # GET /tipos_publicaciones/1
  # GET /tipos_publicaciones/1.json
  def show
  end

  # GET /tipos_publicaciones/new
  def new
    @tipo_publicacion = TipoPublicacion.new
  end

  # GET /tipos_publicaciones/1/edit
  def edit
  end

  # POST /tipos_publicaciones
  # POST /tipos_publicaciones.json
  def create
    @tipo_publicacion = TipoPublicacion.new(tipo_publicacion_params)

    respond_to do |format|
      if @tipo_publicacion.save
        format.html { redirect_to @tipo_publicacion, notice: 'Tipo publicacion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tipo_publicacion }
      else
        format.html { render action: 'new' }
        format.json { render json: @tipo_publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_publicaciones/1
  # PATCH/PUT /tipos_publicaciones/1.json
  def update
    respond_to do |format|
      if @tipo_publicacion.update(tipo_publicacion_params)
        format.html { redirect_to @tipo_publicacion, notice: 'Tipo publicacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tipo_publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_publicaciones/1
  # DELETE /tipos_publicaciones/1.json
  def destroy
    @tipo_publicacion.destroy
    respond_to do |format|
      format.html { redirect_to tipos_publicaciones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_publicacion
      @tipo_publicacion = TipoPublicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_publicacion_params
      params.require(:tipo_publicacion).permit(:nombre)
    end
end
