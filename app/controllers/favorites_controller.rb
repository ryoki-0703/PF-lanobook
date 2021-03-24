class FavoritesController < ApplicationController
  def create
    @lanobe = Lanobe.find(params[:lanobe_id])
    favorite = current_user.favorites.new(lanobe_id: @lanobe.id)
    favorite.save
  end

  def destroy
    @lanobe = Lanobe.find(params[:lanobe_id])
    current_user.favorite_destroy(@lanobe.id)
  end
end
