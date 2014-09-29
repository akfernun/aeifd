class AssetRolesController < ApplicationController
  before_action :set_asset_role, only: [:show, :edit, :update, :destroy]

  # GET /asset_roles
  # GET /asset_roles.json
  def index
    @asset_roles = AssetRole.all
  end

  # GET /asset_roles/1
  # GET /asset_roles/1.json
  def show
  end

  # GET /asset_roles/new
  def new
    @asset_role = AssetRole.new
  end

  # GET /asset_roles/1/edit
  def edit
  end

  # POST /asset_roles
  # POST /asset_roles.json
  def create
    @asset_role = AssetRole.new(asset_role_params)

    respond_to do |format|
      if @asset_role.save
        format.html { redirect_to @asset_role, notice: 'Asset role was successfully created.' }
        format.json { render :show, status: :created, location: @asset_role }
      else
        format.html { render :new }
        format.json { render json: @asset_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_roles/1
  # PATCH/PUT /asset_roles/1.json
  def update
    respond_to do |format|
      if @asset_role.update(asset_role_params)
        format.html { redirect_to @asset_role, notice: 'Asset role was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset_role }
      else
        format.html { render :edit }
        format.json { render json: @asset_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_roles/1
  # DELETE /asset_roles/1.json
  def destroy
    @asset_role.destroy
    respond_to do |format|
      format.html { redirect_to asset_roles_url, notice: 'Asset role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_role
      @asset_role = AssetRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_role_params
      params.require(:asset_role).permit(:name)
    end
end
