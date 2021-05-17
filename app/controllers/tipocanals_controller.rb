class TipocanalsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /tipocanals
  # GET /tipocanals.json
  def index
    @tipocanals = Tipocanal.all
  end

  # GET /tipocanals/1
  # GET /tipocanals/1.json
  def show
  end

  # GET /tipocanals/new
  def new

  end

  # GET /tipocanals/1/edit
  def edit
  end

  # POST /tipocanals
  # POST /tipocanals.json
  def create
    @tipocanal.user_id = current_user.id
    respond_to do |format|
      if @tipocanal.save
        format.html { redirect_to @tipocanal, notice: 'Tipocanal was successfully created.' }
        format.json { render :show, status: :created, location: @tipocanal }
      else
        format.html { render :new }
        format.json { render json: @tipocanal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipocanals/1
  # PATCH/PUT /tipocanals/1.json
  def update
    respond_to do |format|
      if @tipocanal.update(tipocanal_params)
        format.html { redirect_to @tipocanal, notice: 'Tipocanal was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipocanal }
      else
        format.html { render :edit }
        format.json { render json: @tipocanal.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # DELETE /tipocanals/1
  # DELETE /tipocanals/1.json
  def destroy
    @tipocanal.destroy
    respond_to do |format|
      format.html { redirect_to tipocanals_url, notice: 'Tipocanal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def tipocanal_params
      params.require(:tipocanal).permit(:nombre, :user_id)
    end
end
