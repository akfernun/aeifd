class IncidentAssignmentsController < ApplicationController
  before_action :set_incident_assignment, only: [:show, :edit, :update, :destroy]

  # GET /incident_assignments
  # GET /incident_assignments.json
  def index
    @incident_assignments = IncidentAssignment.all
  end

  # GET /incident_assignments/1
  # GET /incident_assignments/1.json
  def show
  end

  # GET /incident_assignments/new
  def new
    @incident_assignment = IncidentAssignment.new
  end

  # GET /incident_assignments/1/edit
  def edit
  end

  # POST /incident_assignments
  # POST /incident_assignments.json
  def create
    @incident_assignment = IncidentAssignment.new(incident_assignment_params)

    respond_to do |format|
      if @incident_assignment.save
        format.html { redirect_to @incident_assignment, notice: 'Incident assignment was successfully created.' }
        format.json { render :show, status: :created, location: @incident_assignment }
      else
        format.html { render :new }
        format.json { render json: @incident_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_assignments/1
  # PATCH/PUT /incident_assignments/1.json
  def update
    respond_to do |format|
      if @incident_assignment.update(incident_assignment_params)
        format.html { redirect_to @incident_assignment, notice: 'Incident assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_assignment }
      else
        format.html { render :edit }
        format.json { render json: @incident_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_assignments/1
  # DELETE /incident_assignments/1.json
  def destroy
    @incident_assignment.destroy
    respond_to do |format|
      format.html { redirect_to incident_assignments_url, notice: 'Incident assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_assignment
      @incident_assignment = IncidentAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_assignment_params
      params.require(:incident_assignment).permit(:incident_id, :floor, :location_id, :asset_role_id, :asset_id, assets_attributes:[:_destroy])
    end
end
