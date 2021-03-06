class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    @book.save
  	redirect_to user_path(current_user.id)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to user_path(current_user.id)
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
