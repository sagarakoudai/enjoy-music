require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    it "名前、メールアドレス、パスワードがあれば有効な状態であること" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      expect(FactoryBot.build(:user, name: "")).not_to be_valid
    end

    it "メールアドレスがなければ無効な状態であること" do
      expect(FactoryBot.build(:user, email: "")).not_to be_valid
    end

    it "重複したメールアドレスなら無効な状態であること" do
      user = FactoryBot.create(:user, name: "test2", password: "test2test2")
      expect(FactoryBot.build(:user)).not_to be_valid
    end

    it "パスワードがなければ無効な状態であること" do
      expect(FactoryBot.build(:user, password: "")).not_to be_valid
    end

    it "パスワードが暗号化されていること" do
      user = FactoryBot.create(:user)
      expect(user.password).not_to eq "testtet"
    end
  end
end
