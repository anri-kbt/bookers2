class BooksController < ApplicationController
  def index
    @books=Book.all
    @user=current_user
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      @user=current_user
      render :index
    end
  end

  def show
    @books=Book.find(params[:id])
    @book_new=Book.new
  end

  def edit
    @book=Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
