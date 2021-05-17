class EquiposController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /equipos
  # GET /equipos.json
  def index
    @equipos = Equipo.all
  end

  # GET /equipos/1
  # GET /equipos/1.json
  def show
  end

  # GET /equipos/new
  def new

  end

  # GET /equipos/1/edit
  def edit
  end

  # POST /equipos
  # POST /equipos.json
  def create

    @equipo.user_id = current_user.id
    respond_to do |format|
      if @equipo.save
        format.html { redirect_to @equipo, notice: 'Equipo was successfully created.' }
        format.json { render :show, status: :created, location: @equipo }
      else
        format.html { render :new }
        format.json { render json: @equipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipos/1
  # PATCH/PUT /equipos/1.json
  def update
    respond_to do |format|
      if @equipo.update(equipo_params)
        format.html { redirect_to @equipo, notice: 'Equipo was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipo }
      else
        format.html { render :edit }
        format.json { render json: @equipo.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # DELETE /equipos/1
  # DELETE /equipos/1.json
  def destroy
    @equipo.destroy
    respond_to do |format|
      format.html { redirect_to equipos_url, notice: 'Equipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipo_params
      params.require(:equipo).permit(:referencia, :descontinuado, :fabricante_id, :user_id)
    end
end
