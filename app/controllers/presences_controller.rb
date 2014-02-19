class PresencesController < ApplicationController
  before_action :set_presence, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :new, :destroy]
  load_and_authorize_resource except: [:create]

  # GET /presences, /users/:user_id/presences
  # GET /presences.json
  def index
    unless params[:user_id]
      @users = User.with_presences
      render 'users_index' and return
    end

    @user = User.find(params[:user_id])
    @presences = @user.presences
  end

  # GET /presences/new
  def new
    @presence = @user.presences.build
  end

  # POST /presences
  # POST /presences.json
  def create
    authorize! :manage, Presence
    @presence = Presence.new(presence_attrs)

    respond_to do |format|
      if @presence.save
        format.html { redirect_to user_presences_path(@presence.user), notice: t('action.create.succeed', entity: Presence.model_name.human) }
        format.json { render action: 'show', status: :created, location: @presence }
      else
        format.html { render action: 'new' }
        format.json { render json: @presence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presences/1
  # DELETE /presences/1.json
  def destroy
    user = @presence.user
    @presence.destroy
    respond_to do |format|
      format.html { redirect_to user_presences_url(user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def presence_attrs
      attrs = presence_params
      attrs.merge!(user: User.find(presence_params[:user])) if presence_params[:user]

      attrs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presence_params
      params.require(:presence).permit(:user, :time)
    end
end
