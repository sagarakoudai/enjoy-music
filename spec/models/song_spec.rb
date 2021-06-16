require 'rails_helper'

RSpec.describe Song, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @style = SongStyle.create(style: "DTM")
  end

  it "Songを保存できること" do
    expect(FactoryBot.build(:song)).to be_valid
  end

  it "タイトルがなければ無効な状態であること" do
    expect(FactoryBot.build(:song, title: "")).not_to be_valid
  end
end
