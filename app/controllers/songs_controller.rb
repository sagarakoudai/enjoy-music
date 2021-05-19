class SongsController < ApplicationController

  def index
    @songs = Song.search(params[:search])
    @song_styles = SongStyle.all
    if params[:sort]
      @songs = Song.where(song_style_id: params[:sort])
    end
  end

  def show
    @song = Song.find(params[:id])
    @comment = Comment.new
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
    @song_styles = SongStyle.all
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.image_id == nil
      @song.image_id == current_user.image_id
    end
    @song.save
    redirect_to songs_path
  end

  def update
    @song = Song.find(params[:id])
    if @song.image_id == nil
      @song.image_id = current_user.image_id
    end
    @song.update(song_params)
    redirect_to songs_path
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end


 private
  def select_song_style
    params.require(:song_style).permit(:select_song_style)
  end

  def song_params
    params.require(:song).permit(:title, :file, :user_id, :song_style_id, :image, :detail)
  end

end
