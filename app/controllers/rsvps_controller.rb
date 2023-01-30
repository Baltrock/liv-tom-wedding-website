class RsvpsController < ApplicationController
  before_action :set_rsvp, only: %i[ show edit update destroy ]

  # GET /rsvps or /rsvps.json
  def index
    @rsvps = Rsvp.where(user: current_user)
    wedding = Date.parse("2023-05-27")
    today = Date.today
    @difference = (wedding - today).to_i
    @rsvp = Rsvp.new
    Rsvp.where(user: current_user)
  end

  # GET /rsvps/1 or /rsvps/1.json
  def show
    wedding = Date.parse("2023-05-27")
    today = Date.today
    @difference = (wedding - today).to_i
    @rsvps = Rsvp.where(user: current_user)
    Rsvp.where(user: current_user)
  end

  # GET /rsvps/new
  def new
    wedding = Date.parse("2023-05-27")
    today = Date.today
    @difference = (wedding - today).to_i
    @rsvp = Rsvp.new
  end

  # GET /rsvps/1/edit
  def edit
    wedding = Date.parse("2023-05-27")
    today = Date.today
    @difference = (wedding - today).to_i
    Rsvp.where(user: current_user)
    @rsvps = Rsvp.where(user: current_user)
  end

  # POST /rsvps or /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)
    @rsvp.user = current_user

    rsvp = current_user.rsvps.new(rsvp_params)
    if @rsvp.save
      redirect_to rsvps_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rsvps/1 or /rsvps/1.json
  def update
    respond_to do |format|
      if @rsvp.update(rsvp_params)
        format.html { redirect_to rsvp_url(@rsvp) }
        format.json { render :index, status: :ok, location: @rsvp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1 or /rsvps/1.json
  def destroy
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to rsvps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rsvp_params
      params.require(:rsvp).permit(:name, :food_requests, :accomodation, :user_id)
    end
end
