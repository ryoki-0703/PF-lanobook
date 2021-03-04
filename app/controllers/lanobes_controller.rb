class LanobesController < ApplicationController
  def new
    @lanobe = Lanobe.new
    @categories = Category.all
  end

  def create
    @lanobe = Lanobe.new(lanobe_params)
    @lanobe.user_id = current_user.id
    @lanobe.save!
    redirect_to lanobes_path
  end

  def index
    @lanobes = Lanobe.page(params[:page]).reverse_order
  end

  def show
    @lanobe = Lanobe.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @lanobe = Lanobe.find(params[:id])
  end

  def update
    lanobe = Lanobe.find(params[:id])
    lanobe.update(lanobe_params)
    redirect_to lanobe_path(lanobe)
  end

  def destroy
    @lanobe = Lanobe.find(params[:id])
    @lanobe.destroy
    redirect_to user_path(current_user)
  end

  private

  def lanobe_params
    params.require(:lanobe).permit(:title, :image, :introduction, :category_id)
  end

end
