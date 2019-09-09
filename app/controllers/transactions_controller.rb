class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit,:update]
  def index
    @transaction = Transaction.includes(:customer,:movie).page(params[:page]).per(10)
    @transaction = @transaction.where(customer_id: params[:customer_id]).page(params[:id]).per(10) if params[:customer_id]
    @transaction = @transaction.where(movie_id: params[:rented_movie_id]).page(params[:id]).per(10) if params[:rented_movie_id]
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(transaction_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      flash[:success] = "Trasanction done"
      redirect_to transactions_path(page: params[:page])
    else
      render :new
    end
  end

  def edit
    #set_transaction
  end

  def update

  end

  private
  def transaction_params
    params.require(:transaction).permit(:customer_id,:movie_id,:quantity)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

end
