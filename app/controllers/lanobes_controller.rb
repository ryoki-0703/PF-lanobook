class LanobesController < ApplicationController
  def new
    @lanobe = Lanobe.new
    @categories = Category.all
  end

  def create
    @lanobe = Lanobe.new(lanobe_params)
    @lanobe.user_id = current_user.id
    if @lanobe.save
      redirect_to lanobes_path
    else
      @categories = Category.all
      render :new
    end
  end

  def index
    if params[:category_id]
      @categroy = Category.find(params[:category_id])
      @lanobes =Lanobe.where(category_id: params[:category_id]).page(params[:page]).reverse_order
    else
      @lanobes =Lanobe.page(params[:page]).reverse_order
    end

  end

  def show
    @lanobe = Lanobe.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @lanobe = Lanobe.find(params[:id])
  end

  def update
    @lanobe = Lanobe.find(params[:id])
    if @lanobe.update(lanobe_params)
      redirect_to lanobe_path(@lanobe)
    else
      render :edit
    end
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
