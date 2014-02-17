class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :update]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    authorize! :manage, Enrollment
    begin
      pupil = Pupil.find(enrollment_params[:pupil])
      group = Group.find(enrollment_params[:group])
    rescue ActiveRecord::RecordNotFound
    end
    @enrollment = Enrollment.new(enrollment_params.merge(pupil: pupil, group: group))

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: t('action.create.succeed', entity: Enrollment.model_name.human) }
        format.json { render action: 'show', status: :created, location: @enrollment }
      else
        format.html { render action: 'new' }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    authorize! :manage, Enrollment
    begin
      pupil = Pupil.find(enrollment_params[:pupil])
      group = Group.find(enrollment_params[:group])
    rescue ActiveRecord::RecordNotFound
    end
    respond_to do |format|
      if @enrollment.update(enrollment_params.merge(pupil: pupil, group: group))
        format.html { redirect_to @enrollment, notice: t('action.update.succeed', entity: Enrollment.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:pupil, :group)
    end
end
