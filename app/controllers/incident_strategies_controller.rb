class IncidentStrategiesController < ApplicationController
  before_action :set_incident_strategy, only: [:show, :edit, :update, :destroy]

  # GET /incident_strategies
  # GET /incident_strategies.json
  def index
    @incident_strategies = IncidentStrategy.all
  end

  # GET /incident_strategies/1
  # GET /incident_strategies/1.json
  def show
  end

  # GET /incident_strategies/new
  def new
    @incident_strategy = IncidentStrategy.new
  end

  # GET /incident_strategies/1/edit
  def edit
  end

  # POST /incident_strategies
  # POST /incident_strategies.json
  def create
    @incident_strategy = IncidentStrategy.new(incident_strategy_params)

    respond_to do |format|
      if @incident_strategy.save
        format.html { redirect_to @incident_strategy, notice: 'Incident strategy was successfully created.' }
        format.json { render :show, status: :created, location: @incident_strategy }
      else
        format.html { render :new }
        format.json { render json: @incident_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_strategies/1
  # PATCH/PUT /incident_strategies/1.json
  def update
    respond_to do |format|
      if @incident_strategy.update(incident_strategy_params)
        format.html { redirect_to @incident_strategy, notice: 'Incident strategy was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_strategy }
      else
        format.html { render :edit }
        format.json { render json: @incident_strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_strategies/1
  # DELETE /incident_strategies/1.json
  def destroy
    @incident_strategy.destroy
    respond_to do |format|
      format.html { redirect_to incident_strategies_url, notice: 'Incident strategy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_strategy
      @incident_strategy = IncidentStrategy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_strategy_params
      params.require(:incident_strategy).permit(:name)
    end
end
