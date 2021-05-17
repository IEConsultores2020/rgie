class CiudadsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def import
    Ciudad.import(params[:file])
    redirect_to root_url, notice: "Ciudades importadas."
  end

  # GET /ciudads
  # GET /ciudads.json
  def index
    @ciudads = Ciudad.all.paginate(page: params[:page], per_page: 50)
  end

  # GET /ciudads/1
  # GET /ciudads/1.json
  def show
  end

  # GET /ciudads/new
  def new

  end

  # GET /ciudads/1/edit
  def edit
  end

  # POST /ciudads
  # POST /ciudads.json
  def create

    @ciudad.user_id = current_user.id
    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to @ciudad, notice: 'Ciudad was successfully created.' }
        format.json { render :show, status: :created, location: @ciudad }
      else
        format.html { render :new }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudads/1
  # PATCH/PUT /ciudads/1.json
  def update
    respond_to do |format|
      if @ciudad.update(ciudad_params)
        format.html { redirect_to @ciudad, notice: 'Ciudad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ciudad }
      else
        format.html { render :edit }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # DELETE /ciudads/1
  # DELETE /ciudads/1.json
  def destroy
    @ciudad.destroy
    respond_to do |format|
      format.html { redirect_to ciudads_url, notice: 'Ciudad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudad_params
      params.require(:ciudad).permit(:name, :latitude, :longitude, :departamento_id, :user_id, :region_id)
    end
end
