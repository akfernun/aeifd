class MaydayAssignmentsController < ApplicationController
  before_action :set_mayday_assignment, only: [:show, :edit, :update, :destroy]

  # GET /mayday_assignments
  # GET /mayday_assignments.json
  def index
    @mayday_assignments = MaydayAssignment.all
  end

  # GET /mayday_assignments/1
  # GET /mayday_assignments/1.json
  def show
  end

  # GET /mayday_assignments/new
  def new
    @mayday_assignment = MaydayAssignment.new
  end

  # GET /mayday_assignments/1/edit
  def edit
  end

  # POST /mayday_assignments
  # POST /mayday_assignments.json
  def create
    @mayday_assignment = MaydayAssignment.new(mayday_assignment_params)

    respond_to do |format|
      if @mayday_assignment.save
        format.html { redirect_to @mayday_assignment, notice: 'Mayday assignment was successfully created.' }
        format.json { render :show, status: :created, location: @mayday_assignment }
      else
        format.html { render :new }
        format.json { render json: @mayday_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mayday_assignments/1
  # PATCH/PUT /mayday_assignments/1.json
  def update
    respond_to do |format|
      if @mayday_assignment.update(mayday_assignment_params)
        format.html { redirect_to @mayday_assignment, notice: 'Mayday assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @mayday_assignment }
      else
        format.html { render :edit }
        format.json { render json: @mayday_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mayday_assignments/1
  # DELETE /mayday_assignments/1.json
  def destroy
    @mayday_assignment.destroy
    respond_to do |format|
      format.html { redirect_to mayday_assignments_url, notice: 'Mayday assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mayday_assignment
      @mayday_assignment = MaydayAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mayday_assignment_params
      params.require(:mayday_assignment).permit(:mayday_id,:asset_id)
    end
end
