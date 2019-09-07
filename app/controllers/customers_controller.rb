class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit,:update,:destroy,:show]
  def index
    @customer = Customer.includes(:transactions).page(params[:page]).per(10)
    @customer = @customer.where(movie_id: params[:rented_movie_id]).references(:transactions).page(params[:page]).per(10) if params[:rented_movie_id]
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

  def edit
    #set_customer
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = "Customer successfully updated!"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy

  end

  def show

  end

  private

  def customer_params
    params.require(:customer).permit(:name,:gender,:status,:age,:email,:address)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
