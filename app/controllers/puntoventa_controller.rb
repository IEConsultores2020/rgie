class PuntoventaController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /puntoventa
  # GET /puntoventa.json
  def index
    if params[:search].present?
      @puntoventa = Puntoventum.near(params[:search], 10, :order => :mtsmaxdistancia)
    else
      @puntoventa = Puntoventum.all
    end      
    respond_to do |format|
      format.html
      format.mobile
    end
  end

  # GET /puntoventa/1
  # GET /puntoventa/1.json
  def show
  end

  # GET /puntoventa/new
  def new
  end

  # GET /puntoventa/1/edit
  def edit
  end

  # POST /puntoventa
  # POST /puntoventa.json
  def create

    @puntoventum.user_id = current_user.id
    respond_to do |format|
      if @puntoventum.save
        format.html { redirect_to @puntoventum, notice: 'Puntoventum was successfully created.' }
        format.json { render :show, status: :created, location: @puntoventum }
      else
        format.html { render :new }
        format.json { render json: @puntoventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puntoventa/1
  # PATCH/PUT /puntoventa/1.json
  def update
    respond_to do |format|
      if @puntoventum.update(puntoventum_params)
        format.html { redirect_to @puntoventum, notice: 'Puntoventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @puntoventum }
      else
        format.html { render :edit }
        format.json { render json: @puntoventum.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # DELETE /puntoventa/1
  # DELETE /puntoventa/1.json
  def destroy
    @puntoventum.destroy
    respond_to do |format|
      format.html { redirect_to puntoventa_url, notice: 'Puntoventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def puntoventum_params
      params.require(:puntoventum).permit(:name, :mtsmaxdistancia, :latitude, :longitude, :direccion, :telefonos, :email, :tipocanal_id, :ciudad_id, :user_id)
    end
end
