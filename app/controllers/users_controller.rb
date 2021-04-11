class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]

  def show
    @lanobes = @user.lanobes.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    @users = @user.followings.page(params[:page]).per(5)
    render 'show_follow'
  end

  def followers
    @users = @user.followers.page(params[:page]).per(5)
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
