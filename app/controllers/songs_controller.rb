class SongsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @song_styles = SongStyle.all
    if params[:sort_style]
      @songs = Song.where(song_style_id: params[:sort_style]).page(params[:page]).reverse_order
    elsif params[:sort_popular]
      @songs = Song.all.sort { |a, b| b.favorites.count <=> a.favorites.count }.first(12)
    else
      @songs = Song.search(params[:search]).page(params[:page]).reverse_order
    end
  end

  def show
    @song = Song.find(params[:id])
    @comment = Comment.new
  end

  def new
    if user_signed_in?
      @song = Song.new
    else
      redirect_to root_path
    end
  end

  def edit
    @song_styles = SongStyle.all
  end

  def create
    @song = Song.new(song_params)
    @song.user_id = current_user.id
    if @song.image_id.nil?
      @song.image_id = current_user.image_id
    end
    if @song.save
      redirect_to songs_path
    else
      flash[:notice] = "入力エラーが発生したため、入力ページにリダイレクトされました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if @song.image_id.nil?
      @song.image_id = current_user.image_id
    end
    if @song.update(song_params)
      redirect_to songs_path
    else
      flash[:notice] = "入力エラーが発生したため、入力ページにリダイレクトされました。"
      redirect_back(fallback_location: root_path)
    end
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
