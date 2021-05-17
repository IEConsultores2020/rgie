class CanalsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /canals
  # GET /canals.json
  def index
    @canals = Canal.all
  end

  # GET /canals/1
  # GET /canals/1.json
  def show
  end

  # GET /canals/new
  def new

  end

  # GET /canals/1/edit
  def edit
  end

  # POST /canals
  # POST /canals.json
  def create

    @canal.user_id = current_user.id
    respond_to do |format|
      if @canal.save
        format.html { redirect_to @canal, notice: 'Canal was successfully created.' }
        format.json { render :show, status: :created, location: @canal }
      else
        format.html { render :new }
        format.json { render json: @canal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canals/1
  # PATCH/PUT /canals/1.json
  def update
    respond_to do |format|
      if @canal.update(canal_params)
        format.html { redirect_to @canal, notice: 'Canal was successfully updated.' }
        format.json { render :show, status: :ok, location: @canal }
      else
        format.html { render :edit }
        format.json { render json: @canal.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # DELETE /canals/1
  # DELETE /canals/1.json
  def destroy
    @canal.destroy
    respond_to do |format|
      format.html { redirect_to canals_url, notice: 'Canal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canal_params
      params.require(:canal).permit(:name, :tipocanal_id, :user_id)
    end
end
