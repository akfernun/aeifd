class TimersController < ApplicationController
  before_action :set_timer, only: [:edit, :update, :destroy]
  before_action :set_updated_timer, only: [:show]

  # GET /timers
  # GET /timers.json
  def index
    @timers = Timer.all
  end

  # GET /timers/1
  # GET /timers/1.json
  def show
  end

  # GET /timers/new
  def new
    @timer = Timer.new
  end

  # GET /timers/1/edit
  def edit
    @timer = Timer.find(params[:id])
    @incident = Incident.find(@timer.incident_id)

    gon.incident= @incident
  end

  # POST /timers
  # POST /timers.json
  def create
    @timer = Timer.new(timer_params)

    respond_to do |format|
      if @timer.save
        format.html { redirect_to @timer, notice: 'Timer was successfully created.' }
        format.json { render :show, status: :created, location: @timer }
      else
        format.html { render :new }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timers/1
  # PATCH/PUT /timers/1.json
  def update
    respond_to do |format|
      if @timer.update(timer_params)
        format.html { redirect_to @timer, notice: 'Timer was successfully updated.' }
        format.json { render :show, status: :ok, location: @timer }
      else
        format.html { render :edit }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timers/1
  # DELETE /timers/1.json
  def destroy
    @timer.destroy
    respond_to do |format|
      format.html { redirect_to timers_url, notice: 'Timer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timer
      @timer = Timer.find(params[:id])
    end

    def set_updated_timer
      @timer = Timer.where(incident_id: params[:id])[0]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timer_params
      params.require(:timer).permit(:primary_search, :all_clear, :utilities_contacted, :safety_officer_arrived, :utilities_disconnected, :secondary_search, :fire_under_control, :incident_id)
    end
end
