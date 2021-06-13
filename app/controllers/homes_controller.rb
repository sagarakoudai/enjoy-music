class HomesController < ApplicationController
  def top
    @songs = Song.all
    @songs_popular = @songs.sort { |a, b| b.favorites.count <=> a.favorites.count }.take(3)
  end

  def about
  end
end
