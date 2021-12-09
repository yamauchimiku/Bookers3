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
    # 他人のユーザー編集画面に推移できないようにする
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    # バリデーションの結果を表示
    if @user.update(user_params)
      # サクセスメッセージの表示
      flash[:notice] = 'You have updated post successfully.'
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  # ユーザー情報のストロングパラメーター
  private
  def user_params
    params.require(:user).permit(:name, :information, :myprofile_image)
  end
end
