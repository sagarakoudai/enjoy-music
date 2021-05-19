class Song < ApplicationRecord
  mount_uploader :file, AudioFileUploader
  attachment :image

  belongs_to :user
  belongs_to :song_style
  has_many :favorites,dependent: :destroy
  has_many :comments,dependent: :destroy

  validates :title, presence: true
  validates :file, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      @song = Song.where(['title LIKE(?) or detail LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Song.all
    end
  end

end
