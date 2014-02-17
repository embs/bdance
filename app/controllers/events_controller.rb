class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    authorize! :manage, Event
    @event = Event.new(event_attrs)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: t('action.create.succeed', entity: Event.model_name.human) }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize! :manage, Event
    respond_to do |format|
      if @event.update(event_attrs)
        format.html { redirect_to @event, notice: t('action.update.succeed', entity: Event.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def event_attrs
      attrs = event_params
      attrs.merge!(attendances_attributes: attendances_attrs) if attendances_attrs

      attrs
    end

    def attendances_attrs
      return nil if !event_params[:attendances_attributes]
      attendances_attrs = {}
      event_params[:attendances_attributes].each { |k,v| attendances_attrs.merge!(k => v.merge(user: User.find(v["user"]))) }

      attendances_attrs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :local, :date, :hour,
        attendances_attributes: [:id, :user, :_destroy])
    end
end
