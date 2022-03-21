class BooksController < ApplicationController
  def index
    @books=Book.all #すべてのBookを取得
    @book=Book.new
    @user=current_user
    @users=@book.user #Bookに紐づいているユーザー情報を@usersに代入
  end

  def create
    @book=Book.new(book_params) #フォームから送られてきたデータをストロングパラメータを経由して@bookに代入
    @book.user_id=current_user.id #ユーザーIDの情報をdeviseメソッドを使ってログインしている自分のIDを
    if @book.save
      redirect_to book_path(@book.id),notice:"You have created book successfully."
    else
      @books=Book.all
      @user=current_user
      render :index
    end
  end

  def show
    @books=Book.find(params[:id])
    @user=@books.user
    @book=Book.new
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user==current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id),notice:"You have updated book successfully."
    else
      render 'edit'
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
