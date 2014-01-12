class PresencesController < ApplicationController
  before_action :set_presence, only: [:show, :edit, :update, :destroy]

  # GET /presences
  # GET /presences.json
  def index
    @presences = User.find(params[:user_id]).presences
  end

  # GET /presences/new
  def new
    @presence = Presence.new
  end

  # POST /presences
  # POST /presences.json
  def create
    @presence = Presence.new(presence_attrs)

    respond_to do |format|
      if @presence.save
        format.html { redirect_to user_presences_path(@presence.user), notice: 'Presence was successfully created.' }
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
