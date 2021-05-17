class PlanvisitaController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_userassign
  before_filter :prepare_puntoventumassign
  load_and_authorize_resource

  # GET /planvisita
  # GET /planvisita.json
  def index                
    start_date = Date.today
    end_date = Date.today.end_of_month
    if current_user.admin?  then
      @planvisita = Planvisitum.all.order("fechavisita DESC, puntoventum_id ASC")
    elsif current_user.adminaccount? then
      @planvisita = Planvisitum.where(:fechavisita => start_date..end_date, :usuarioasignado => current_user.id).order("fechavisita DESC, puntoventum_id ASC")        
    elsif current_user.supervisor? then
      @planvisita = Planvisitum.where(:fechavisita => start_date..end_date, :user_id => current_user.id).order("fechavisita DESC, puntoventum_id ASC")
    elsif current_user.merchandizer? or current_user.promoter? then
      @planvisita = Planvisitum.where(:fechavisita => start_date..end_date, :usuarioasignado => current_user.id).order("fechavisita DESC, puntoventum_id ASC")        
    end
  end

  # GET /planvisita/1
  # GET /planvisita/1.json
  def show
  end

  # GET /planvisita/new
  def new

  end

  # GET /planvisita/1/edit
  def edit
  end

  # POST /planvisita
  # POST /planvisita.json
  def create

    @planvisitum.user_id = current_user.id
    respond_to do |format|
      if @planvisitum.save
        format.html { redirect_to @planvisitum, notice: 'Planvisitum was successfully created.' }
        format.json { render :show, status: :created, location: @planvisitum }
      else
        format.html { render :new }
        format.json { render json: @planvisitum.errors, status: :unprocessable_entity }
      end
    end
  end
      

  # PATCH/PUT /planvisita/1
  # PATCH/PUT /planvisita/1.json
  def update
    respond_to do |format|
      if @planvisitum.update(planvisitum_params)
        format.html { redirect_to @planvisitum, notice: 'Planvisitum was successfully updated.' }
        format.json { render :show, status: :ok, location: @planvisitum }
      else
        format.html { render :edit }
        format.json { render json: @planvisitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planvisita/1
  # DELETE /planvisita/1.json
  def destroy
    @planvisitum.destroy
    respond_to do |format|
      format.html { redirect_to planvisita_url, notice: 'Planvisitum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def planvisitum_params
      params.require(:planvisitum).permit(:usuarioasignado, :fechavisita, :puntoventum_id, :user_id)
    end

    def prepare_userassign
      if current_user.ciudad_id  != nil
        @users = User.joins(:ciudad => :region).where("region_id =  ? ", 
               current_user.ciudad.region_id).order(:name)
      #else
      #  @users = User.all.order(:name)
      end 
    end

    def prepare_puntoventumassign
      if current_user.ciudad_id != nil        
        @puntoventa = Puntoventum.joins(:ciudad => :region).where("region_id =  ? ", current_user.ciudad.region_id).order(:name)
      #else
      #  @puntoventa = Puntoventum.all.order(:name)
      end 
    end
end
