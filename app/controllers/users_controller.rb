class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lanobes = @user.lanobes.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page]).per(5)
    render 'show_follow'
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page]).per(5)
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
