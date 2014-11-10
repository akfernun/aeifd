class IncidentsController < ApplicationController
  before_action :set_incident, only: [:deployRIT, :show, :edit, :update, :destroy]


  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    @scenes = Scene.where(incident_id: params[:id])
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
    scenes = @incident.scenes.build
    gon.incident=1
  end

  def deployRIT
    @rit = IncidentAssignment.where(incident_id: @incident, asset_role_id: 3)

    if @entry = Entry.create(name: "#{@rit[0].asset.name} was deployed. ", incident_id: @incident.id)
      respond_to do |format|
      if @incident.save
        format.html { redirect_to edit_incident_path(@incident), notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # GET /incidents/1/edit
  def edit
    @task = @incident.task
    gon.incident= @incident
    @rit2 = IncidentAssignment.where(incident_id: @incident, asset_role_id: 3)

  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)

    logger.debug "These are the params #{params[:incident_assignments_attributes]}"
    respond_to do |format|
      if @incident.save
        format.html { redirect_to edit_incident_path(@incident), notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to edit_incident_path(@incident), notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:name,:battalion_id,:incident_strategy_id,:scene_type_id, incident_assignments_attributes: [:id, :floor, :incident_id, :location_id, :asset_role_id, :asset_id,:_destroy], scenes_attributes: [:id, :floor, :incident_id,:battalion_id, :name, :scene_type_id, :_destroy, scene_assignments_attributes: [:id, :floor, :incident_id, :scene_id, :asset_id, :arrival_time, :location_id, :asset_role_id, :_destroy]])
    end
end
