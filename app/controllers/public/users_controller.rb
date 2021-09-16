class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_mypage_path
  end

  def confirm
  end

  def quit
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :email, :introduction, :is_active)
  end
end