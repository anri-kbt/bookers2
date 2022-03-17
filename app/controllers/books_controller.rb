class BooksController < ApplicationController
  def index
    @books=Book.all
    @user=current_user
  end

  def show
  end

  def edit
  end
  
  private
  def post_image_params
    params.require(:book).permit(:title,:body)
  end
end
