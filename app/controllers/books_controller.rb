class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  def index
    books = Book.all
    render json: { books: books }, status: :ok
  end

  def show
    render json: @book, status: :ok
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: {}, status: :no_content
    else
      render json: { errors: @item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    render json: {}, status: :no_content
  end


  private

  def book_params
    params.require(:book).permit(:title, :description, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
