class Song < ApplicationRecord
  mount_uploader :file, AudioFileUploader
  attachment :image

  belongs_to :user
  belongs_to :song_style
  has_many :favorites
  has_many :comments

  validates :title, presence: true
  validates :file, presence: true
end
