class InventariosController < ApplicationController 
  layout false , except: [:index, :new, :show, :edit ]
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => [:imprimir_datos, :imprimir_codbarras]  

  def import
    Inventario.import(params[:file])
    redirect_to inventarios_path, notice: "Inventario importado correctamente."
  end
  
  # GET /inventarios
  # GET /inventarios.json
  #def index
    #@inventarios = Inventario.all.order("fecha_ingreso ASC")
  #end

  # GET /inventarios/1
  # GET /inventarios/1.json
  def show
  end

  # GET /inventarios/new
  def new
    inventario =  params[:cantidad_integer].to_f * params[:valor_unidad].to_i
  end

  # GET /inventarios/1/edit
  def edit
  end

  # POST /inventarios
  # POST /inventarios.json
  def create
    @inventario.user_id = current_user.id
    respond_to do |format|
      if @inventario.save
        format.html { redirect_to @inventario, notice: 'Inventario was successfully created.' }
        format.json { render :show, status: :created, location: @inventario }
      else
        format.html { render :new }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventarios/1
  # PATCH/PUT /inventarios/1.json
  def update
    respond_to do |format|
      if @inventario.update(inventario_params)
        format.html { redirect_to @inventario, notice: 'Inventario was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventario }
      else
        format.html { render :edit }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventarios/1
  # DELETE /inventarios/1.json
  def destroy
    @inventario.destroy
    respond_to do |format|
      format.html { redirect_to inventarios_url, notice: 'Inventario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   def index
     if params[:search] and params[:filter] and params[:datefilter] 
       @inventarios = Inventario.search(params[:search], params[:filter], params[:datefilter]).order("nombre ASC").paginate(page: params[:page], per_page: 50)   
       #@reportes = Inventario.search(params[:search], params[:filter], params[:datefilter]).order("nombre ASC")
     else
       @inventarios = Inventario.order("articulo_id ASC").paginate(page: params[:page], per_page: 50)  
     end
     respond_to do |format|
      format.html
      format.csv { send_data @inventarios.to_csv }
      format.xls 
     end
  end

  def imprimir_datos
    
    if params[:search] and params[:filter]  and params[:datefilter] 
       @inventarios = Inventario.search(params[:search],params[:filter], params[:datefilter]).order("nombre ASC")   
    else
       @inventarios = Inventario.order("articulo_id ASC")
    end    
     respond_to do |format|
      format.html
      format.pdf
      format.xls 
     end
  end  
  
  def imprimir_codbarras
    if params[:search] and params[:filter] and params[:datefilter] 
       @inventarios = Inventario.search(params[:search],  params[:filter], params[:datefilter]).order("nombre ASC")   
    else
       @inventarios = Inventario.order("articulo_id ASC")
    end
     respond_to do |format|
      format.html
      format.xls 
     end
  end  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventario
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventario_params
      params.require(:inventario).permit(:valor_venta, :num_factura,:fecha_ingreso, :moneda, :cantidad_integer, :valor_unidad, :valor_total, :tienda_id, :articulo_id, :user_id)
    end
end
