class PublicacionesController < ApplicationController
  before_action :set_publicacion, only: [:show, :edit, :update, :destroy]

  # GET /publicaciones
  # GET /publicaciones.json
  def index
    @publicaciones = cargar_publicaciones
  end

  # GET /publicaciones/1
  # GET /publicaciones/1.json
  def show
  end

  # GET /publicaciones/new
  def new
    @publicacion = Publicacion.new
  end

  # GET /publicaciones/1/edit
  def edit
  end

  # POST /publicaciones
  # POST /publicaciones.json
  def create
    @publicacion = Publicacion.new(publicacion_params)

    respond_to do |format|
      if @publicacion.save
        format.html { redirect_to @publicacion, notice: 'Publicacion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @publicacion }
      else
        format.html { render action: 'new' }
        format.json { render json: @publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicaciones/1
  # PATCH/PUT /publicaciones/1.json
  def update
    respond_to do |format|
      if @publicacion.update(publicacion_params)
        format.html { redirect_to @publicacion, notice: 'Publicacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicaciones/1
  # DELETE /publicaciones/1.json
  def destroy
    @publicacion.destroy
    respond_to do |format|
      format.html { redirect_to publicaciones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicacion
      @publicacion = Publicacion.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicacion_params
      params.require(:publicacion).permit(:titulo, :texto, :url_original, :nombre_autor, :tipo_id, :leer_de_url)
    end

    def cargar_publicaciones
      if autor = Autor.find_by_id(params[:autor_id])
        autor.publicaciones
      else
        Publicacion.all
      end
    end
end
