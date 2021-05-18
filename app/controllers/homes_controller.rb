class HomesController < ApplicationController
  def top
    @songs = Song.all
    @songs_popular = Song.where
  end

  def about
  end
end
