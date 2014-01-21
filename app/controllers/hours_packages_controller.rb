class HoursPackagesController < ApplicationController
  before_action :set_hours_package, only: [:show, :edit, :update, :destroy]

  # GET /hours_packages
  # GET /hours_packages.json
  def index
    @hours_packages = HoursPackage.all
  end

  # GET /hours_packages/1
  # GET /hours_packages/1.json
  def show
  end

  # GET /hours_packages/new
  def new
    @hours_package = HoursPackage.new
  end

  # GET /hours_packages/1/edit
  def edit
  end

  # POST /hours_packages
  # POST /hours_packages.json
  def create
    @hours_package = HoursPackage.new(hours_package_attrs)

    respond_to do |format|
      if @hours_package.save
        format.html { redirect_to @hours_package, notice: t('action.create.succeed', entity: HoursPackage.model_name.human) }
        format.json { render action: 'show', status: :created, location: @hours_package }
      else
        format.html { render action: 'new' }
        format.json { render json: @hours_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hours_packages/1
  # PATCH/PUT /hours_packages/1.json
  def update
    respond_to do |format|
      if @hours_package.update(hours_package_attrs)
        format.html { redirect_to @hours_package, notice: t('action.update.succeed', entity: HoursPackage.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hours_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours_packages/1
  # DELETE /hours_packages/1.json
  def destroy
    @hours_package.destroy
    respond_to do |format|
      format.html { redirect_to hours_packages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hours_package
      @hours_package = HoursPackage.find(params[:id])
    end

    def hours_package_attrs
      attrs = hours_package_permitted_params
      attrs.merge!(teacher: Teacher.find(hours_package_permitted_params[:teacher])) if hours_package_permitted_params[:teacher]
      attrs.merge!(private_classes_attributes: private_classes_attrs) if private_classes_attrs

      attrs
    end

    def private_classes_attrs
      return nil if !hours_package_permitted_params[:private_classes_attributes]
      private_classes_attrs = {}
      hours_package_permitted_params[:private_classes_attributes].each { |k, v| private_classes_attrs.merge!(k => v.merge(pupil: Pupil.find(v["pupil"]))) }

      private_classes_attrs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hours_package_permitted_params
      params.require(:hours_package).permit(:teacher, :price, :horaries, :start, :end,
        horaries_attributes: [:id, :day, :start, :end, :_destroy],
        private_classes_attributes: [:id, :pupil, :_destroy])
    end
end
