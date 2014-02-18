class MonthlyFeesController < ApplicationController
  before_action :set_monthly_fee, only: [:show, :edit, :update, :destroy]
  before_action :set_pupil, only: [:new, :create, :show, :edit, :update, :destroy]

  # GET /monthly_fees, /pupils/:pupil_id/monthly_fees
  # GET /monthly_fees.json
  def index
    authorize! :manage, Pupil
    unless params[:pupil_id]
      @pupils = Pupil.enrolled
      render 'pupils_index' and return
    end

    @pupil = Pupil.find(params[:pupil_id])
    @monthly_fees = @pupil.monthly_fees
  end

  # GET /monthly_fees/1
  # GET /monthly_fees/1.json
  def show
    authorize! :manage, Pupil
  end

  # GET /monthly_fees/new
  def new
    authorize! :manage, Pupil
    @monthly_fee = @pupil.monthly_fees.build
  end

  # GET /monthly_fees/1/edit
  def edit
    authorize! :manage, Pupil
  end

  # POST /monthly_fees
  # POST /monthly_fees.json
  def create
    authorize! :manage, Pupil
    @monthly_fee = MonthlyFee.new(monthly_fee_params)
    @monthly_fee.pupil = @pupil

    respond_to do |format|
      if @monthly_fee.save
        format.html { redirect_to pupil_monthly_fees_path(@pupil), notice: 'Monthly fee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @monthly_fee }
      else
        format.html { render action: 'new' }
        format.json { render json: @monthly_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_fees/1
  # PATCH/PUT /monthly_fees/1.json
  def update
    authorize! :manage, Pupil
    respond_to do |format|
      if @monthly_fee.update(monthly_fee_params)
        format.html { redirect_to pupil_monthly_fees_path(@pupil), notice: 'Monthly fee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @monthly_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_fees/1
  # DELETE /monthly_fees/1.json
  def destroy
    authorize! :manage, Pupil
    @monthly_fee.destroy
    respond_to do |format|
      format.html { redirect_to pupil_monthly_fees_path(@pupil) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_fee
      @monthly_fee = MonthlyFee.find(params[:id])
    end

    def set_pupil
      @pupil = Pupil.find(params[:pupil_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_fee_params
      params.require(:monthly_fee).permit(:id, :amount, :due_date)
    end
end
