class KardexesController < ApplicationController
  before_action :set_kardex, only: [:show, :edit, :update, :destroy]

  # GET /kardexes
  # GET /kardexes.json
  def index
    @kardexes = Kardex.all
  end

  # GET /kardexes/1
  # GET /kardexes/1.json
  def show
  end

  # GET /kardexes/new
  def new
    @kardex = Kardex.new
  end

  # GET /kardexes/1/edit
  def edit
  end

  # POST /kardexes
  # POST /kardexes.json
  def create
    @kardex = Kardex.new(kardex_params)

    respond_to do |format|
      if @kardex.save
        format.html { redirect_to @kardex, notice: 'Kardex was successfully created.' }
        format.json { render :show, status: :created, location: @kardex }
      else
        format.html { render :new }
        format.json { render json: @kardex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kardexes/1
  # PATCH/PUT /kardexes/1.json
  def update
    respond_to do |format|
      if @kardex.update(kardex_params)
        format.html { redirect_to @kardex, notice: 'Kardex was successfully updated.' }
        format.json { render :show, status: :ok, location: @kardex }
      else
        format.html { render :edit }
        format.json { render json: @kardex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kardexes/1
  # DELETE /kardexes/1.json
  def destroy
    @kardex.destroy
    respond_to do |format|
      format.html { redirect_to kardexes_url, notice: 'Kardex was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kardex
      @kardex = Kardex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kardex_params
      params.require(:kardex).permit(:valor_compra, :valor_venta, :fecha_ingreso, :inventario_id)
    end
end
