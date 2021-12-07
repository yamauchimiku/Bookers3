class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    # @userに紐付けられた投稿だけを表示
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  # ユーザー情報のストロングパラメーター
  private
  def user_params
    params.require(:user).permit(:name, :information, :myprofile_image)
  end
end
