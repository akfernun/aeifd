class CheckoffsController < ApplicationController
  before_action :set_checkoff, only: [:show, :edit, :update, :destroy]

  # GET /checkoffs
  # GET /checkoffs.json
  def index
    @checkoffs = Checkoff.all
  end

  # GET /checkoffs/1
  # GET /checkoffs/1.json
  def show
  end

  # GET /checkoffs/new
  def new
    @checkoff = Checkoff.new
  end

  # GET /checkoffs/1/edit
  def edit
  end

  # POST /checkoffs
  # POST /checkoffs.json
  def create
    @checkoff = Checkoff.new(checkoff_params)

    respond_to do |format|
      if @checkoff.save
        format.html { redirect_to @checkoff, notice: 'Checkoff was successfully created.' }
        format.json { render :show, status: :created, location: @checkoff }
      else
        format.html { render :new }
        format.json { render json: @checkoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkoffs/1
  # PATCH/PUT /checkoffs/1.json
  def update
    respond_to do |format|
      if @checkoff.update(checkoff_params)
        format.html { redirect_to @checkoff, notice: 'Checkoff was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkoff }
      else
        format.html { render :edit }
        format.json { render json: @checkoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkoffs/1
  # DELETE /checkoffs/1.json
  def destroy
    @checkoff.destroy
    respond_to do |format|
      format.html { redirect_to checkoffs_url, notice: 'Checkoff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkoff
      @checkoff = Checkoff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkoff_params
      params.require(:checkoff).permit(:name, :checkofftype)
    end
end
