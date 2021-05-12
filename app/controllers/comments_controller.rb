class CommentsController < ApplicationController

  def create
    @song = Song.find(params[:song_id])
    @comment = current_user.comments.new(comment_params)
    @comment.song_id = @song.id
    @comment.save
    redirect_to song_path(@song)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], song_id: params[:song_id])
    @comment.destroy
    redirect_to song_path(params[:song_id])
  end



 private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
