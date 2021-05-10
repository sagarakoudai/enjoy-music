class Song < ApplicationRecord
  mount_uploader :file, AudioFileUploader
  
  belongs_to :user
  belongs_to :song_style

  validates :title, presence: true
  validates :file, presence: true
end
