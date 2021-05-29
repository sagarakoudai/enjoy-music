class SongsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy, :new]

  def index
    @songs = Song.search(params[:search]).order(updated_at: "DESC")
    @song_styles = SongStyle.all
    if params[:sort_style]
      @songs = Song.where(song_style_id: params[:sort_style])
    elsif params[:sort_popular]
      @songs_popular = @songs.sort {|a,b| b.favorites.count <=> a.favorites.count}
      @songs = @songs_popular
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
    @song_styles = SongStyle.all
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.image_id == nil
       @song.image_id = current_user.image_id
    end
    @song.save
    redirect_to songs_path
  end

  def update
    if @song.image_id == nil
      @song.image_id = current_user.image_id
    end
    @song.update(song_params)
    redirect_to songs_path
  end

  def destroy
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

  def correct_user
    if user_signed_in?
      @song = Song.find(params[:id])
      @user = @song.user
      unless @user == current_user
        redirect_to root_path
      end
    else
       redirect_to root_path
    end
  end

end
