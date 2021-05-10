class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
    @song_styles = SongStyle.all
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.save!
      redirect_to songs_path
    end
  end

  def update
  end

  def destroy
  end

  private
  def select_song_style
    params.require(:song_style).permit(:select_song_style)
  end

  def song_params
    params.require(:song).permit(:title, :file, :user_id, :song_style_id)
  end


end
