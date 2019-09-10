class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit,:update,:destroy,:show]

  def index
    @customer = Customer.includes(:transactions).page(params[:page]).per(10)
    @customer = @customer.find(params[:transaction_id]) if params[:transaction_id]
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    @customer.user_id = current_user.id
    if @customer.save
      flash[:success] = "Customer successfully added!"
      redirect_to customers_path
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = "Customer successfully updated!"
      redirect_to customers_path(page: params[:page])
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name,:gender,:status,:age,:email,:address)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
