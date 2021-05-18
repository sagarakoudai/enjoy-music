class SongStyle < ApplicationRecord
  has_many :songs

  def select_song_style
    [style].join
  end

end
