require 'rails_helper'

RSpec.describe "ログイン前のテスト", type: :system do
  let!(:user) { create(:user) }
  let!(:song_style) { create(:song_style) }
  let!(:song) { create(:song) }

  before do
    visit root_path
  end

  describe "ヘッダーのテスト:ログイン前" do
    it "タイトルを押すとトップ画面に遷移する" do
      click_link "ENJOY MUSIC!", match: :first
      expect(page).to have_content "ENJOY MUSIC!へようこそ！"
    end

    it "Sign Upを押すと新規登録画面に遷移する" do
      click_link "Sign Up"
      expect(page).to have_content "Password confirmation"
    end

    it "Sign inを押すとログイン画面に遷移する" do
      click_link "Sign in"
      expect(page).to have_content "Forgot your password?"
    end

    it "Songsを押すと楽曲一覧画面に遷移する" do
      click_link "Songs"
      expect(page).to have_content "example title"
    end

    it "Aboutを押すとアバウト画面に遷移する" do
      click_link "About"
      expect(page).to have_content "Welcome to ENJOY MUSIC!"
    end
  end

  describe "ユーザーの新規登録" do
    it "新規登録する 完了後、トップページへ" do
      visit new_user_registration_path
      fill_in "user[name]", with: "aaaaaa"
      fill_in "user[email]", with: "iiiiii@test.com"
      fill_in "user[password]", with: "uuuuuu"
      fill_in "user[password_confirmation]", with: "uuuuuu"
      click_button "Sign up"
      expect(page).to have_content "ENJOY MUSIC!へようこそ！"
    end
  end

  describe "表示の確認:ログイン前" do
    before do
      visit song_path(1)
    end

    it "フォローのリンクが表示されない" do
      expect(page).to_not have_content "フォローする"
    end

    it "お気に入りのリンクが表示されない" do
      expect(page).to_not have_link 0
    end

    it "コメント入力フォームが表示されない" do
      expect(page).to_not have_content "コメントする"
    end
  end

  describe "ログイン機能" do
    it "ログインする 完了後、トップページへ" do
      click_link "Sign in"
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button "Log in"
      expect(page).to have_content "新しい曲"
    end
  end

end
