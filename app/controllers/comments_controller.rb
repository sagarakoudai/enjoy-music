class CommentsController < ApplicationController

  def create
    @song = Song.find(params[:song_id])
    @comment = current_user.comments.new(comment_params)
    @comment.song_id = @song.id
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @song = @comment.song
    @comment.destroy
  end



 private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
