class BlacklistsController < ApplicationController
  before_action :set_blacklist, only: %i[ show edit update destroy ]

  # GET /blacklists or /blacklists.json
  def index
    @blacklists = Blacklist.where(user: current_user)
    wedding = Date.parse("2023-05-27")
    today = Date.today
    @difference = (wedding - today).to_i
    @blacklist = Blacklist.new
  end

  # GET /blacklists/1 or /blacklists/1.json
  def show
    @blacklists = Blacklist.where(user: current_user)
  end

  # GET /blacklists/new
  def new
    @blacklist = Blacklist.new
  end

  # GET /blacklists/1/edit
  def edit
  end

  # POST /blacklists or /blacklists.json

  def create
    @blacklist = Blacklist.new(blacklist_params)
    @blacklist.user = current_user

    blacklist = current_user.blacklists.new(blacklist_params)
    if @blacklist.save
      redirect_to blacklists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blacklists/1 or /blacklists/1.json
  def update
    respond_to do |format|
      if @blacklist.update(blacklist_params)
        format.html { redirect_to blacklist_url(@blacklist) }
        format.json { render :show, status: :ok, location: @blacklist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blacklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blacklists/1 or /blacklists/1.json
  def destroy
    @blacklist.destroy

    respond_to do |format|
      format.html { redirect_to blacklists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blacklist
      @blacklist = Blacklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blacklist_params
      params.require(:blacklist).permit(:name, :user_id)
    end
end
