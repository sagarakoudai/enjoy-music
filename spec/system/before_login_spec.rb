require 'rails_helper'

RSpec.describe "ログイン前のテスト", type: :system do
  let!(:user) { create(:user) }
  let!(:song_style) { create(:song_style) }
  let!(:song) { create(:song) }

  describe "ヘッダーのテスト:ログイン前" do
    it "タイトルを押すとトップ画面に遷移する"
    it "Sign Upを押すと新規登録画面に遷移する"
    it "Sign inを押すとログイン画面に遷移する"
    it "Songsを押すと楽曲一覧画面に遷移する"
    it "Aboutを押すとアバウト画面に遷移する"
  end

  describe "ユーザーの新規登録" do
    # it "新規登録する 完了後、トップページへ" do
    #   visit new_user_registration_path
    # end
  end

  describe "表示の確認:ログイン前" do
    before do
      visit song_path(1)
    end

    it "フォローのリンクが表示されない"
    it "お気に入りのリンクが表示されない"
    it "コメント入力フォームが表示されない"
  end

  describe "ログイン機能" do
    it "ログインする 完了後、トップページへ" do
      visit root_path
      click_link "Sign in"
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button "Log in"
      expect(page).to have_content "新しい曲"
    end
  end

end
