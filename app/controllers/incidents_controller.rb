class IncidentsController < ApplicationController
  before_action :set_incident, only: [:deployRIT, :sendemail, :show, :edit, :update, :destroy,:endincident ]


  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all
  end

  def sendemail
    @incident.email_address = params[:email_address]
    LogMailer.mailer(@incident).deliver

    respond_to do |format|
      format.html { redirect_to incident_path(@incident), notice: "Email was sent to #{@incident.email_address}." }
      format.json { render :show, status: :created, location: @incident }
    end
  end

  def endincident
    @incident.end_time = Time.now
    t = @incident.end_time - @incident.created_at
      mm, ss = t.divmod(60)
      hh, mm = mm.divmod(60)
      dd, hh = hh.divmod(24)
    @duration= "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]

      respond_to do |format|
        if @incident.save
          format.html { redirect_to incident_path(@incident), notice: "Incident was successfully ended. Duration:#{@duration} " }
          format.json { render :show, status: :created, location: @incident }
        else
          format.html { render :new }
          format.json { render json: @incident.errors, status: :unprocessable_entity }
        end
      end
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
    @rit = IncidentAssignment.where(incident_id: @incident, asset_role_id: 5  )

    mayday_incident_assignment_id = params[:incident_assignment_id]

    mayday = Mayday.create(incident_assignment_id: mayday_incident_assignment_id, name: "Mayday for #{IncidentAssignment.find(mayday_incident_assignment_id).asset.name}")
    #mayday.save

    @rit.first.update_attribute(:asset_role_id, 6)
  
    respond_to do |format|
        if mayday.save
          format.html { redirect_to edit_incident_path(@incident), notice: 'Incident was successfully created.' }
          format.json { render :show, status: :created, location: @incident }
        else
          format.html { render :new }
          format.json { render json: @incident.errors, status: :unprocessable_entity }
        end
      end

    #logger.debug "***********************the incident for #{mayday_incident_assignment_id} is #{IncidentAssignment.find(mayday_incident_assignment_id).incident_id}"

    #if @entry = Entry.create(name: "#{@rit[0].asset.name} was deployed. ", incident_id: @incident.id)
    #  respond_to do |format|
    #    if @incident.save
    #      format.html { redirect_to edit_incident_path(@incident), notice: 'Incident was successfully created.' }
    #      format.json { render :show, status: :created, location: @incident }
    #    else
    #      format.html { render :new }
    #      format.json { render json: @incident.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end
  end

  # GET /incidents/1/edit
  def edit
    @task = @incident.task
    gon.incident= @incident
    @rit2 = IncidentAssignment.where(incident_id: @incident, asset_role_id: 5)
    @maydays = Mayday.where(incident_assignment_id: @incident.incident_assignments, end_time: nil)

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
      params.require(:incident).permit(:name,:email_address,:end_time, :battalion_id,:incident_strategy_id,:scene_type_id, incident_assignments_attributes: [:id, :floor, :incident_id, :location_id, :asset_role_id, :asset_id,:_destroy], scenes_attributes: [:id, :floor, :incident_id,:battalion_id, :name, :scene_type_id, :_destroy, scene_assignments_attributes: [:id, :floor, :incident_id, :scene_id, :asset_id, :arrival_time, :location_id, :asset_role_id, :_destroy]])
    end
end
