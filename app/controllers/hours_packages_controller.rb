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
    @hours_package = HoursPackage.new(hours_package_params)

    respond_to do |format|
      if @hours_package.save
        format.html { redirect_to @hours_package, notice: 'Hours package was successfully created.' }
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
      if @hours_package.update(hours_package_params)
        format.html { redirect_to @hours_package, notice: 'Hours package was successfully updated.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def hours_package_params
      params.require(:hours_package).permit(:pupils_id, :teacher_id, :price, :horaries, :start, :end)
    end
end
