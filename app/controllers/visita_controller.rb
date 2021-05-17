class VisitaController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_planvisitumassign
  load_and_authorize_resource  
  
  
  # GET /visita
  # GET /visita.json
  def index
   if current_user.promoter? || current_user.merchandizer? || current_user.supervisor? then
      start_date = Date.today.beginning_of_year
      end_date = Date.today.end_of_month
      @visita = Visitum.where(:user_id => current_user.id).order("horasalida DESC")
      #@visita = @visita.usuarioasignado(current_user.id)
      #@visita = Visitum.all.order("horasalida DESC") 
   else
      @visita = Visitum.all.order("horasalida DESC")
   end
    respond_to do |format|
      format.html
      format.mobile
    end
  end 

  # GET /visita/1
  # GET /visita/1.json
  def show
    
  end

  # GET /visita/new
  def new

  end

  # GET /visita/1/edit
  def edit
    
  end

  # POST /visita
  # POST /visita.json
  def create
    #@visitum.distance_to(”Eiffel Tower”)
    @lat_lng = cookies[:lat_lng].split("|")
    @puntoventa = @visitum.puntoventum
    @visitum.user_id = current_user.id
    @visitum.IPin = request.remote_ip
    @visitum.horaingreso = Time.now
    @visitum.latitude = @lat_lng[0]
    @visitum.longitude = @lat_lng[1]
    @distance = @visitum.distance_from(@puntoventa, :units=>:kms)
    respond_to do |format|
      if @visitum.save
        format.html { redirect_to @visitum, notice: 'Visita was successfully created.' }
        format.json { render :show, status: :created, location: @visitum }
      else
        format.html { render :new }
        format.json { render json: @visitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visita/1
  # PATCH/PUT /visita/1.json
  def update    
    @lat_lng = cookies[:lat_lng].split("|")
    @visitum.latitude2 = @lat_lng[0]
    @visitum.longitude2 = @lat_lng[1]
    @visitum.IPout = request.remote_ip
    @visitum.horasalida = Time.now    
    respond_to do |format|
      if @visitum.update(visitum_params)
        format.html { redirect_to @visitum, notice: 'Visita was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitum }
      else
        format.html { render :edit }
        format.json { render json: @visitum.errors, status: :unprocessable_entity }
        format.json { render :js => "getGeoLocation();"}
        @visitum.IPout = request.ip

      end
    end
  end

  # DELETE /visita/1
  # DELETE /visita/1.json
  def destroy
    @visitum.destroy
    respond_to do |format|
      format.html { redirect_to visita_url, notice: 'Visita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def visitum_params
      params.require(:visitum).permit(:puntoventum_id, :horaingreso, :horasalida, :latitude, :longitude, :latitude2, :longitude2,  :user_id, :IPin, :IPout)
    end

    #Filtra los punto de venta
    def prepare_planvisitumassign
      start_date = Date.today
      end_date = Date.today.end_of_month
      if current_user.id != nil        
        @planvisita = Planvisitum.joins(:puntoventum).where(usuarioasignado:  current_user.id, fechavisita: start_date..end_date).order("puntoventa.name").select("planvisita.*,puntoventa.name as name")
      #else
      #  @puntoventa = Puntoventum.all.order(:name)
      end 
    end 
end
