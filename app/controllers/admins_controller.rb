class AdminsController < ApplicationController
  # before_action :find_user

  # def find_user
  #   @admin = Admin.find_by(params[:id])
  # end

  # GET /information_forms or /information_forms.json
  def primary
  end

  # GET /user/1 or /user/1.json
  def show
  end

  # GET /user/1/edit
  def edit
  end

  def new
    @admin = Admin.new
  end

  # POST /users or /users.json
  def create
    # admin = Admin.create(user_params)
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_url(@admin)}
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @ben.update(ben_params)
        format.html { redirect_to admin_url(@admin) }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admin_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:name)
    end
end
