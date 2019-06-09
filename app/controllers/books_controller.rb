class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about]
  before_action :correct_user, only: [:edit, :update]
  def top
  end
  def about
  end

  def index
  	@books = Book.all
  	@book = Book.new
  	@user = User.find(current_user.id)
  end
  def show
  	@book_new = Book.new
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  	redirect_to book_path(@book), notice: "Book was successfully created"
	else
    @books = Book.all
    @book_new = Book.new
    @user = User.find(current_user.id)
	  render :index
	end
  end
  def edit
  	@book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully updated"
  else
    render :edit 
    end
  end
  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
  def correct_user
    book = Book.find(params[:id])
    if book.user_id != current_user.id
      redirect_to books_path, notice: "error"
    end
  end
end
