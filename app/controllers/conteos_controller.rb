class ConteosController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_conteo, only: [:show, :edit, :update, :destroy]

  def import
    Conteo.import(params[:file])
    redirect_to root_url, notice: "Importados correctamente."
  end
  
  # GET /conteos
  # GET /conteos.json
  def index
    @conteos = Conteo.all
  end

  # GET /conteos/1
  # GET /conteos/1.json
  def show
  end

  # GET /conteos/new
  def new
    @conteo = Conteo.new
  end

  # GET /conteos/1/edit
  def edit
  end

  # POST /conteos
  # POST /conteos.json
  def create
    @conteo = Conteo.new(conteo_params)

    respond_to do |format|
      if @conteo.save
        format.html { redirect_to @conteo, notice: 'Conteo was successfully created.' }
        format.json { render :show, status: :created, location: @conteo }
      else
        format.html { render :new }
        format.json { render json: @conteo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conteos/1
  # PATCH/PUT /conteos/1.json
  def update
    respond_to do |format|
      if @conteo.update(conteo_params)
        format.html { redirect_to @conteo, notice: 'Conteo was successfully updated.' }
        format.json { render :show, status: :ok, location: @conteo }
      else
        format.html { render :edit }
        format.json { render json: @conteo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conteos/1
  # DELETE /conteos/1.json
  def destroy
    @conteo.destroy
    respond_to do |format|
      format.html { redirect_to conteos_url, notice: 'Conteo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conteo
      @conteo = Conteo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conteo_params
      params.require(:conteo).permit(:cantidad, :codbarras, :inventario_id)
    end
end
