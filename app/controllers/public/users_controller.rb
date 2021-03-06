class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_mypage_path
    else
      render :edit
    end
  end

  def confirm
  end

  def quit
    @user = current_user
    @user.update(is_active: false)
    # ログアウト
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :email, :introduction, :is_active)
  end
end