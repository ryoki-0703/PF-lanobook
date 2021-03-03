class LanobesController < ApplicationController
  def new
    @lanobe = Lanobe.new
  end

  def create
    @lanobe = LanobeImage.new(lanobe_params)
    @lanobe.user_id = current_user.id
    @lanobe.save
    redirect_to lanobe_path
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def lanobe_params
    params.require(:lanobe).permit(:title, :image, :introduction)
  end

end
