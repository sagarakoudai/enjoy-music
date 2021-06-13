require 'rails_helper'

RSpec.describe Song, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @style = SongStyle.create(style: "DTM")
  end

  it "Songを保存できること" do
    # file_path = File.join(Rails.root, 'spec/files/My_Song_6.mp3')
    #     song = Song.create(
    #     user_id: @user.id,
    #     song_style_id: 1,
    #     title: 'example title',
    #     file: Rack::Test::UploadedFile.new(file_path),
    #     )
    #     expect(song.valid?).to eq true
    expect(FactoryBot.build(:song)).to be_valid
  end

  it "タイトルがなければ無効な状態であること" do
    expect(FactoryBot.build(:song, title: "")).not_to be_valid
  end
end
