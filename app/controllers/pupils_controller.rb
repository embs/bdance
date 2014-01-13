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
    @pupil = Pupil.new(pupil_attrs)

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
      if @pupil.update(pupil_attrs)
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

    def pupil_attrs
      attrs = pupil_params
      attrs.merge!(birth: birthday_attr) if birthday_attr
      attrs.delete 'birth(1i)'
      attrs.delete 'birth(2i)'
      attrs.delete 'birth(3i)'
      attrs.merge!(phone_numbers_attributes: phone_numbers_attrs) if phone_numbers_attrs

      attrs
    end

    def birthday_attr
      return nil if !pupil_params['birth(1i)']

      Date.new(pupil_params['birth(1i)'].to_i, pupil_params['birth(2i)'].to_i, pupil_params['birth(3i)'].to_i)
    end

    def phone_numbers_attrs
      return nil if !pupil_params[:phone_numbers_attributes]
      attrs = {}
      pupil_params[:phone_numbers_attributes].each { |k,v| attrs.merge!(k => v) }

      attrs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_params
      params.require(:pupil).permit(:first_name, :last_name, :username, :email,
        :password, :rg, :cpf, :birth, :phone, :profession, :observations,
        phone_numbers_attributes: [:id, :kind, :ddd, :number, :provider, :_destroy])
    end
end
