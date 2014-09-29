class SceneAssignmentsController < ApplicationController
  before_action :set_scene_assignment, only: [:show, :edit, :update, :destroy]

  # GET /scene_assignments
  # GET /scene_assignments.json
  def index
    @scene_assignments = SceneAssignment.all
  end

  # GET /scene_assignments/1
  # GET /scene_assignments/1.json
  def show
  end

  # GET /scene_assignments/new
  def new
    @scene_assignment = SceneAssignment.new
  end

  # GET /scene_assignments/1/edit
  def edit
  end

  # POST /scene_assignments
  # POST /scene_assignments.json
  def create
    @scene_assignment = SceneAssignment.new(scene_assignment_params)

    respond_to do |format|
      if @scene_assignment.save
        format.html { redirect_to @scene_assignment, notice: 'Scene assignment was successfully created.' }
        format.json { render :show, status: :created, location: @scene_assignment }
      else
        format.html { render :new }
        format.json { render json: @scene_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene_assignments/1
  # PATCH/PUT /scene_assignments/1.json
  def update
    respond_to do |format|
      if @scene_assignment.update(scene_assignment_params)
        format.html { redirect_to @scene_assignment, notice: 'Scene assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene_assignment }
      else
        format.html { render :edit }
        format.json { render json: @scene_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene_assignments/1
  # DELETE /scene_assignments/1.json
  def destroy
    @scene_assignment.destroy
    respond_to do |format|
      format.html { redirect_to scene_assignments_url, notice: 'Scene assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene_assignment
      @scene_assignment = SceneAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene_assignment_params
      params.require(:scene_assignment).permit(:scene_id, :asset_id, :arrival_time, :location)
    end
end
