class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def create
    @song = Song.find(params[:song_id])
    @favorite = current_user.favorites.new(song_id: @song.id)
    @favorite.save
    redirect_to song_path(@song)
  end

  def destroy
    @song = Song.find(params[:song_id])
    @favorite = current_user.favorites.find_by(song_id: @song.id)
    @favorite.destroy
    redirect_to song_path(@song)
  end
end
