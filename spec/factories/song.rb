FactoryBot.define do
  factory :song do
    user_id { 1 }
    song_style_id { 1 }
    title { 'example title' }
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/My_Song_6.mp3')) }
  end
end