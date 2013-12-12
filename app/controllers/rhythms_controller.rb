class RhythmsController < ApplicationController
  before_action :set_rhythm, only: [:show, :edit, :update, :destroy]

  # GET /rhythms
  # GET /rhythms.json
  def index
    @rhythms = Rhythm.all
  end

  # GET /rhythms/1
  # GET /rhythms/1.json
  def show
  end

  # GET /rhythms/new
  def new
    @rhythm = Rhythm.new
  end

  # GET /rhythms/1/edit
  def edit
  end

  # POST /rhythms
  # POST /rhythms.json
  def create
    @rhythm = Rhythm.new(rhythm_params.merge({ modality: Modality.find(rhythm_params[:modality]) }))

    respond_to do |format|
      if @rhythm.save
        format.html { redirect_to @rhythm, notice: 'Rhythm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rhythm }
      else
        format.html { render action: 'new' }
        format.json { render json: @rhythm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rhythms/1
  # PATCH/PUT /rhythms/1.json
  def update
    respond_to do |format|
      if @rhythm.update(rhythm_params.merge({ modality: Modality.find(rhythm_params[:modality]) }))
        format.html { redirect_to @rhythm, notice: 'Rhythm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rhythm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rhythms/1
  # DELETE /rhythms/1.json
  def destroy
    @rhythm.destroy
    respond_to do |format|
      format.html { redirect_to rhythms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rhythm
      @rhythm = Rhythm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rhythm_params
      params.require(:rhythm).permit(:name, :description, :modality)
    end
end
