class UsersController < ApplicationController
  def index
    @user=User.find(params[:id])
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
  end
  
  private
  def post_image_params
    params.require(:book).permit(:title,:body)
  end
  
end
