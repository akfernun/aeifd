class MaydaysController < ApplicationController
  before_action :set_mayday, only: [:show, :edit, :update, :destroy]

  # GET /maydays
  # GET /maydays.json
  def index
    @maydays = Mayday.all
  end

  # GET /maydays/1
  # GET /maydays/1.json
  def show
    @incident = IncidentAssignment.find(@mayday.incident_assignment_id).incident_id
  end

  # GET /maydays/new
  def new
    @mayday = Mayday.new
  end

  # GET /maydays/1/edit
  def edit
    @incident = IncidentAssignment.find(@mayday.incident_assignment_id).incident_id
  end

  # POST /maydays
  # POST /maydays.json
  def create
    @mayday = Mayday.new(mayday_params)

    respond_to do |format|
      if @mayday.save
        format.html { redirect_to @mayday, notice: 'Mayday was successfully created.' }
        format.json { render :show, status: :created, location: @mayday }
      else
        format.html { render :new }
        format.json { render json: @mayday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maydays/1
  # PATCH/PUT /maydays/1.json
  def update
    respond_to do |format|
      if @mayday.update(mayday_params)
        format.html { redirect_to edit_mayday_path(@mayday), notice: 'Mayday was successfully updated.' }
        format.json { render :show, status: :ok, location: @mayday }
      else
        format.html { render :edit }
        format.json { render json: @mayday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maydays/1
  # DELETE /maydays/1.json
  def destroy
    @mayday.destroy
    respond_to do |format|
      format.html { redirect_to maydays_url, notice: 'Mayday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mayday
      @mayday = Mayday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mayday_params
      params.require(:mayday).permit(:incident_assignment_id, :code, mayday_assignments_attributes: [:id, :mayday_id, :asset_id,:_destroy])
    end
end
