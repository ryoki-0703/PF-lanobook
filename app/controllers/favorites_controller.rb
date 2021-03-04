class FavoritesController < ApplicationController
  def create
    lanobe = Lanobe.find(params[:lanobe_id])
    favorite = current_user.favorites.new(lanobe_id: lanobe.id)
    favorite.save
    redirect_back(fallback_location: lanobe_path(lanobe))
  end

  def destroy
    lanobe = Lanobe.find(params[:lanobe_id])
    favorite = current_user.favorites.find_by(lanobe_id: lanobe.id)
    favorite.destroy
    redirect_back(fallback_location: lanobe_path(lanobe))
  end
end
