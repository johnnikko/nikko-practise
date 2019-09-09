class Admin::EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit,:update,:destroy,:show]

  def index
    @employees = Employee.page(params[:page]).per(10)
  end

  def show
    #set employee
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      @account = Account.create(email: @employee.email,password: "qwer4321")
      @account.employee_id = @employee.id
      @account.save
      flash['success'] = "Employee successfuly added!"
      redirect_to admin_employees_path
    else
      render :new
    end
  end

  def edit
    #set employee
  end

  def update
    if @employee.update(employee_params)
      flash['success'] = "Employee successfuly update!"
      redirect_to admin_employees_path(page: params[:page])
    else
      render :edit
    end
  end

  def destroy
    if @employee.destroy
      flash['success'] = "Employee successfuly deleted!"
      redirect_to admin_employees_path
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name,:last_name,:middle_name,:status,:position,:contact_number,:address,:email)
  end
end
