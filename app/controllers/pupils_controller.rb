class PupilsController < ApplicationController
  before_action :set_pupil, only: [:show, :edit, :update, :destroy]

  # GET /pupils
  # GET /pupils.json
  def index
    @pupils = Pupil.all
  end

  # GET /pupils/1
  # GET /pupils/1.json
  def show
  end

  # GET /pupils/new
  def new
    @pupil = Pupil.new
  end

  # GET /pupils/1/edit
  def edit
  end

  # POST /pupils
  # POST /pupils.json
  def create
    if pupil_params['birth(1i)']
      birthday = Date.new(pupil_params['birth(1i)'].to_i,
        pupil_params['birth(2i)'].to_i, pupil_params['birth(3i)'].to_i)
    end
    @pupil = Pupil.new(pupil_params.except('birth(1i)', 'birth(2i)', 'birth(3i)'))
    @pupil.update(birth: birthday) if birthday

    respond_to do |format|
      if @pupil.save
        format.html { redirect_to @pupil, notice: 'Pupil was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pupil }
      else
        format.html { render action: 'new' }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pupils/1
  # PATCH/PUT /pupils/1.json
  def update
    respond_to do |format|
      if @pupil.update(pupil_params.except('birth(1i)', 'birth(2i)', 'birth(3i)'))
        if pupil_params['birth(1i)']
          birthday = Date.new(pupil_params['birth(1i)'].to_i,
            pupil_params['birth(2i)'].to_i, pupil_params['birth(3i)'].to_i)
          @pupil.update(birth: birthday)
        end
        format.html { redirect_to @pupil, notice: 'Pupil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupils/1
  # DELETE /pupils/1.json
  def destroy
    @pupil.destroy
    respond_to do |format|
      format.html { redirect_to pupils_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil
      @pupil = Pupil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_params
      params.require(:pupil).permit(:first_name, :last_name, :username, :mail, :rg, :cpf, :birth, :phone, :profession, :observations)
    end
end
