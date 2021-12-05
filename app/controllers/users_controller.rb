class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # ユーザー情報のストロングパラメーター
  private
  def user_params
    params.require(:user).permit(:name, :information, :myprofile_image)
  end
end
