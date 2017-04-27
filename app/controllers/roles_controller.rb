class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    if ( !logged_in? || !current_user.can?("view", "roles"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end
    
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    if ( !logged_in? || !current_user.can?("view", "roles"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end
  end

  # GET /roles/new
  def new
    if ( !logged_in? || !current_user.can?("create", "roles"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end
    
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
    if ( !logged_in? || !current_user.can?("edit", "roles"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end
  end

  # POST /roles
  # POST /roles.json
  def create
    # Check capabilities
    if ( !logged_in? || !current_user.can?("create", "roles"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end

    @role = Role.new(:name => role_params[:name])

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if ( !logged_in? || !current_user.can?("edit", "role"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end

    respond_to do |format|
      if @role.update(:name => role_params[:name])
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    # Check capabilities
    if ( !logged_in? || !current_user.can?("destroy", "roles"))
      flash[:danger] = "Sorry, you don't have the capabilities to do this"
      redirect_to roles_path
      return
    end

    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.fetch(:role, {})
    end
end
