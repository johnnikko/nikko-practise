class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.includes(:customer,:movie).page(params[:id]).per(10)
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
      redirect_to transactions_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def transaction_params
    params.require(:transaction).permit(:customer_id,:movie_id,:quantity)
  end

end
