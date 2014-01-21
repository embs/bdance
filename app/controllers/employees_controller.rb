class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    if ['Teacher', 'Manager'].include?(employee_params['responsibility'])
      @employee = (eval "#{employee_params['responsibility']}.new(employee_attrs)")
    else
      @employee = Employee.new(employee_attrs)
    end

    respond_to do |format|
      if @employee.save
        format.html { redirect_to Employee.last, notice: t('action.create.succeed', entity: Employee.model_name.human) }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if responsibility_changes?
      new_employee = Employee.new_from_old(employee_params['responsibility'], @employee)
      @employee.destroy
      new_employee.save
      @employee = new_employee
    end

    respond_to do |format|
      if @employee.update(employee_attrs)
        format.html { redirect_to (@employee.try(:employee) || @employee), notice: t('action.update.succeed', entity: Employee.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def responsibility_changes?
      employee_params['responsibility'] && employee_params['responsibility'] != @employee.responsibility
    end

    def employee_attrs
      attrs = employee_params
      attrs.merge!(birth: birthday_attr) if birthday_attr
      attrs.delete 'birth(1i)'
      attrs.delete 'birth(2i)'
      attrs.delete 'birth(3i)'
      attrs.merge!(phone_numbers_attributes: phone_numbers_attrs) if phone_numbers_attrs

      attrs
    end

    def birthday_attr
      return nil if !employee_params['birth(1i)']

      Date.new(employee_params['birth(1i)'].to_i, employee_params['birth(2i)'].to_i, employee_params['birth(3i)'].to_i)
    end

    def phone_numbers_attrs
      return nil if !employee_params[:phone_numbers_attributes]
      attrs = {}
      employee_params[:phone_numbers_attributes].each { |k,v| attrs.merge!(k => v) }

      attrs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :password,
        :password_confirmation, :username, :rg, :cpf, :birth, :phone, :responsibility, :wage,
        phone_numbers_attributes: [:id, :kind, :ddd, :number, :provider, :_destroy])
    end
end
