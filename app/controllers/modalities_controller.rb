class ModalitiesController < ApplicationController
  before_action :set_modality, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :update]

  # GET /modalities
  # GET /modalities.json
  def index
    @modalities = Modality.all
  end

  # GET /modalities/1
  # GET /modalities/1.json
  def show
  end

  # GET /modalities/new
  def new
    @modality = Modality.new
  end

  # GET /modalities/1/edit
  def edit
  end

  # POST /modalities
  # POST /modalities.json
  def create
    authorize! :manage, Modality
    @modality = Modality.new(modality_params)

    respond_to do |format|
      if @modality.save
        format.html { redirect_to @modality, notice: t('action.create.succeed', entity: Modality.model_name.human) }
        format.json { render action: 'show', status: :created, location: @modality }
      else
        format.html { render action: 'new' }
        format.json { render json: @modality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modalities/1
  # PATCH/PUT /modalities/1.json
  def update
    authorize! :manage, Modality
    respond_to do |format|
      if @modality.update(modality_params)
        format.html { redirect_to @modality, notice: t('action.update.succeed', entity: Modality.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @modality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modalities/1
  # DELETE /modalities/1.json
  def destroy
    @modality.destroy
    respond_to do |format|
      format.html { redirect_to modalities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modality
      @modality = Modality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modality_params
      params.require(:modality).permit(:name, :description)
    end
end
