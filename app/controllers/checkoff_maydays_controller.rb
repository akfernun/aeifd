class CheckoffMaydaysController < ApplicationController
  before_action :set_checkoff_mayday, only: [:domaydaycheckoff,:show, :edit, :update, :destroy]

  # GET /checkoff_maydays
  # GET /checkoff_maydays.json
  def index
    @checkoff_maydays = CheckoffMayday.all
  end

  # GET /checkoff_maydays/1
  # GET /checkoff_maydays/1.json
  def show
  end

  # GET /checkoff_maydays/new
  def new
    @checkoff_mayday = CheckoffMayday.new
  end

  # GET /checkoff_maydays/1/edit
  def edit
  end


  def domaydaycheckoff

    respond_to do |format|

      if @checkoff_mayday.update_attribute(:status, "complete")

        myreturn = {:success => true, :name => @checkoff_mayday.checkoff.name}.to_json

          format.json { render json: myreturn }
      else
        myreturn = {:success => false, :name => @checkoff_mayday.checkoff.name}.to_json

        format.json {render json: myreturn}


      end
    end
  end

  # POST /checkoff_maydays
  # POST /checkoff_maydays.json
  def create
    @checkoff_mayday = CheckoffMayday.new(checkoff_mayday_params)

    respond_to do |format|
      if @checkoff_mayday.save
        format.html { redirect_to @checkoff_mayday, notice: 'Checkoff mayday was successfully created.' }
        format.json { render :show, status: :created, location: @checkoff_mayday }
      else
        format.html { render :new }
        format.json { render json: @checkoff_mayday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkoff_maydays/1
  # PATCH/PUT /checkoff_maydays/1.json
  def update
    respond_to do |format|
      if @checkoff_mayday.update(checkoff_mayday_params)
        format.html { redirect_to @checkoff_mayday, notice: 'Checkoff mayday was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkoff_mayday }
      else
        format.html { render :edit }
        format.json { render json: @checkoff_mayday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkoff_maydays/1
  # DELETE /checkoff_maydays/1.json
  def destroy
    @checkoff_mayday.destroy
    respond_to do |format|
      format.html { redirect_to checkoff_maydays_url, notice: 'Checkoff mayday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkoff_mayday
      @checkoff_mayday = CheckoffMayday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkoff_mayday_params
      params.require(:checkoff_mayday).permit(:mayday_id, :checkoff_id, :status)
    end
end
