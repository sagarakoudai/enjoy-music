class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    @user = User.find(params[:id])
  end

  def unfollow
    current_user.unfollow(params[:id])
    @user = User.find(params[:id])
  end

  def follow_index
    @user = User.find(params[:user_id])
  end

  def follower_index
    @user = User.find(params[:user_id])
  end

end
