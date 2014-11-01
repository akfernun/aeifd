class BattalionsController < ApplicationController
  before_action :set_battalion, only: [:show, :edit, :update, :destroy]

  # GET /battalions
  # GET /battalions.json
  def index
    @battalions = Battalion.all
  end

  # GET /battalions/1
  # GET /battalions/1.json
  def show
  end

  # GET /battalions/new
  def new
    @battalion = Battalion.new
  end

  # GET /battalions/1/edit
  def edit
  end

  # POST /battalions
  # POST /battalions.json
  def create
    @battalion = Battalion.new(battalion_params)

    respond_to do |format|
      if @battalion.save
        format.html { redirect_to @battalion, notice: 'Battalion was successfully created.' }
        format.json { render :show, status: :created, location: @battalion }
      else
        format.html { render :new }
        format.json { render json: @battalion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battalions/1
  # PATCH/PUT /battalions/1.json
  def update
    respond_to do |format|
      if @battalion.update(battalion_params)
        format.html { redirect_to @battalion, notice: 'Battalion was successfully updated.' }
        format.json { render :show, status: :ok, location: @battalion }
      else
        format.html { render :edit }
        format.json { render json: @battalion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battalions/1
  # DELETE /battalions/1.json
  def destroy
    @battalion.destroy
    respond_to do |format|
      format.html { redirect_to battalions_url, notice: 'Battalion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battalion
      @battalion = Battalion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battalion_params
      params.require(:battalion).permit(:name)
    end
end
