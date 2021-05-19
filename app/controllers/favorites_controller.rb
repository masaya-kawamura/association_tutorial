class FavoritesController < ApplicationController

  def create
    favorite = Favorite.new(tweet_id: params[:tweet_id])
    favorite.user_id = current_user.id
    favorite.save
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    favorite.destroy
    redirect_to tweet_path(params[:tweet_id])
  end
end
