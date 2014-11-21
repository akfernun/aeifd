class CheckoffIncidentsController < ApplicationController
  before_action :set_checkoff_incident, only: [:show, :edit, :update, :destroy, :docheckoff]

  # GET /checkoff_incidents
  # GET /checkoff_incidents.json
  def index
    @checkoff_incidents = CheckoffIncident.all
  end

  # GET /checkoff_incidents/1
  # GET /checkoff_incidents/1.json
  def show
  end

  # GET /checkoff_incidents/new
  def new
    @checkoff_incident = CheckoffIncident.new
  end

  # GET /checkoff_incidents/1/edit
  def edit
  end

  def docheckoff
    #logger.debug "here is the checkoff id #{params[:checkoffid]}"

    #logger.debug "LOOK FOR THIS #{@record[0]}"

    respond_to do |format|

      if @checkoff_incident.update_attribute(:status, "complete")
        formatted_time = @checkoff_incident.updated_at.strftime('%Y-%m-%d %H:%M:%S')
        # formatted_date = @incident.created_at.strftime('%Y-%m-%d');
        myreturn = {:success => true, :name => @checkoff_incident.checkoff.name, :updated => formatted_time}.to_json

          format.json { render json: myreturn }
      else
        myreturn = {:success => false, :name => @checkoff_incident.checkoff.name}.to_json

        format.json {render json: myreturn}


      end
    end
  end

  # POST /checkoff_incidents
  # POST /checkoff_incidents.json
  def create
    @checkoff_incident = CheckoffIncident.new(checkoff_incident_params)

    respond_to do |format|
      if @checkoff_incident.save
        format.html { redirect_to @checkoff_incident, notice: 'Checkoff incident was successfully created.' }
        format.json { render :show, status: :created, location: @checkoff_incident }
      else
        format.html { render :new }
        format.json { render json: @checkoff_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkoff_incidents/1
  # PATCH/PUT /checkoff_incidents/1.json
  def update
    respond_to do |format|
      if @checkoff_incident.update(checkoff_incident_params)
        format.html { redirect_to @checkoff_incident, notice: 'Checkoff incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkoff_incident }
      else
        format.html { render :edit }
        format.json { render json: @checkoff_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkoff_incidents/1
  # DELETE /checkoff_incidents/1.json
  def destroy
    @checkoff_incident.destroy
    respond_to do |format|
      format.html { redirect_to checkoff_incidents_url, notice: 'Checkoff incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkoff_incident
      @checkoff_incident = CheckoffIncident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkoff_incident_params
      params.require(:checkoff_incident).permit(:incident_id, :checkoff_id, :status)
    end
end
