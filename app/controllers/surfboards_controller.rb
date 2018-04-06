class SurfboardsController < ApplicationController
  before_action :set_surfboard, only: [:show, :edit, :update, :destroy]

  # GET /surfboards
  # GET /surfboards.json
  def index
    params[:filters] ||= {date: Date.today}
    @beaches = Beach.all
    @surfboards = Surfboard.where(nil)
    @surfboards = @surfboards.where(beach_id: params[:filters][:beach]) if !!params[:filters][:beach]
    @surfboards = policy_scope(@surfboards).order(created_at: :desc)
    @surfboards = @surfboards.select { |s| s.available_on?(params[:filters][:date]) }

    @markers = @surfboards.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude
      }
    end
  end

  # GET /surfboards/1
  # GET /surfboards/1.json
  def show
  end

  # GET /surfboards/new
  def new
    @current_user = current_user
    @surfboard = Surfboard.new
    authorize @surfboard
  end

  # GET /surfboards/1/edit
  def edit
  end

  # POST /surfboards
  # POST /surfboards.json
  def create
    @surfboard = Surfboard.new(surfboard_params)

    authorize @surfboard

    respond_to do |format|
      if @surfboard.save!
        format.html { redirect_to @surfboard, notice: 'Surfboard was successfully created.' }
        format.json { render :show, status: :created, location: @surfboard }
      else
        format.html { render :new }
        format.json { render json: @surfboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surfboards/1
  # PATCH/PUT /surfboards/1.json
  def update
    respond_to do |format|
      if @surfboard.update(surfboard_params)
        format.html { redirect_to @surfboard, notice: 'Surfboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @surfboard }
      else
        format.html { render :edit }
        format.json { render json: @surfboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surfboards/1
  # DELETE /surfboards/1.json
  def destroy
    @surfboard.destroy
    respond_to do |format|
      format.html { redirect_to surfboards_url, notice: 'Surfboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_boards
    @surfboards = SurfboardPolicy::Scope.new(current_user, Surfboard).my_boards.order(created_at: :desc)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
    authorize @surfboard
  end

  # @full_params = [:photo, :beach_id, :beach, :name, :price_hash, :description, :address, :user_id, :board_type, :available]

  # Never trust parameters from the scary internet, only allow the white list through.
  def surfboard_params
    params.require(:surfboard).permit(:photo, :beach_id, :name, :description, :address, :user_id, :board_type, :available, price_hash: {})
  end
end
