require 'rails_helper'

RSpec.describe "ログイン後のテスト", type: :system do
  let!(:user) { create(:user) }
  let!(:song_style) { create(:song_style) }
  let!(:song) { create(:song) }

  before do
    visit root_path
    click_link "Sign in"
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button "Log in"
  end


  describe "ヘッダーのテスト:ログイン後" do
    it "タイトルを押すとトップ画面に遷移する"
    it "New Songを押すと楽曲投稿画面に遷移する"
    it "My Pageを押すとマイページ画面に遷移する"
    it "Songsを押すと楽曲一覧画面に遷移する"
    it "Sign outを押すとログアウトし、トップ画面に遷移する"
  end

  describe "楽曲投稿機能" do
    it "楽曲の投稿 完了後、楽曲一覧ページへ" do
      click_link "New Song"
      attach_file "song_file", "#{Rails.root}/spec/files/My_Song_6.mp3"
      fill_in "song[title]", with: "testsong"
      click_button "アップロード"
      expect(page).to have_content "testsong"
    end
  end
  
  describe "楽曲編集機能" do
    it "楽曲の編集 完了後、楽曲一覧ページへ"
  end
  
  describe "プロフィール編集" do
    it "プロフィールの編集 完了後、マイページへ"
  end
end
