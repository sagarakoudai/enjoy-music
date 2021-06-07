class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @songs = @user.songs.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
    if  @user.update(user_params)
      redirect_to user_path
    else
      flash[:notice] = "入力エラーが発生したため、入力ページにリダイレクトされました。"
      redirect_back(fallback_location: root_path)
    end
  end



 private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def correct_user
    if user_signed_in?
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to root_path
      end
    else
       redirect_to root_path
    end
  end

end
