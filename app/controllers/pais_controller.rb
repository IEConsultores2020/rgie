class PaisController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  
  def import
    Pai.import(params[:file])
    redirect_to root_url, notice: "Paises importados."
  end

  # GET /pais
  # GET /pais.json
  def index
    @pais = Pai.all
  end

  # GET /pais/1
  # GET /pais/1.json
  def show
  end

  # GET /pais/new
  def new

  end

  # GET /pais/1/edit
  def edit
  end

  # POST /pais
  # POST /pais.json
  def create

    @pai.user_id = current_user.id
    respond_to do |format|
      if @pai.save
        format.html { redirect_to @pai, notice: 'Pais was successfully created.' }
        format.json { render :show, status: :created, location: @pai }
      else
        format.html { render :new }
        format.json { render json: @pai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pais/1
  # PATCH/PUT /pais/1.json
  def update
    respond_to do |format|
      if @pai.update(pai_params)
        format.html { redirect_to @pai, notice: 'Pais was successfully updated.' }
        format.json { render :show, status: :ok, location: @pai }
      else
        format.html { render :edit }
        format.json { render json: @pai.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /pais/1
  # DELETE /pais/1.json
  def destroy
    @pai.destroy
    respond_to do |format|
      format.html { redirect_to pais_url, notice: 'Pais was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private



    # Never trust parameters from the scary internet, only allow the white list through.
    def pai_params
      params.require(:pai).permit(:name, :huso, :user_id)
    end
end
