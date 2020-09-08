class BorrowsController < ApplicationController
  before_action :authenticate_user, only: %i[update index]
  before_action :find_borrow, only: %i[update]

  def index
    borrows = Borrow.where(user: current_user)
    render json: borrows, include: ['book'], status: :ok
  end

  def create
    borrow = current_user.borrows.new(borrow_params)
    borrow.status = 'Borrowed'
    if borrow.save
      render json: borrow, status: :created
    else
      render json: { errors: borrow.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @borrow.update(borrow_params)
      render json: { borrow: {
        id: @borrow.id,
        status: @borrow.status
      } }, status: :ok
    else
      render json: { errors: @borrow.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def find_borrow
    @borrow = Borrow.find(params[:id])
  end

  def borrow_params
    params.require(:borrow).permit(:status, :user_id, :book_id)
  end
end
