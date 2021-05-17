class VentaController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /venta
  # GET /venta.json
  def index
    @venta = Ventum.all
    respond_to do |format|
      format.html
      format.mobile
    end
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
  end

  # GET /venta/new
  def new

  end

  # GET /venta/1/edit
  def edit
  end

  # POST /venta
  # POST /venta.json
  def create

    @ventum.user_id = current_user.id
    respond_to do |format|
      if @ventum.save
        format.html { redirect_to @ventum, notice: 'Ventum was successfully created.' }
        format.json { render :show, status: :created, location: @ventum }
      else
        format.html { render :new }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  def update
    respond_to do |format|
      if @ventum.update(ventum_params)
        format.html { redirect_to @ventum, notice: 'Ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @ventum }
      else
        format.html { render :edit }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    @ventum.destroy
    respond_to do |format|
      format.html { redirect_to venta_url, notice: 'Ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def ventum_params
      params.require(:ventum).permit(:fecha, :qexistencia, :qventa, :puntoventum_id, :equipo_id, :user_id)
    end
end
