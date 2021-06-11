require 'rails_helper'

RSpec.describe "Songs", type: :system do

  before do
    @user = FactoryBot.create(:user)
    @style = SongStyle.create(style: "DTM")
  end

	it "ログイン後、トップページが表示される" do
		visit root_path
		click_link "Sign in"
		fill_in 'user[email]', with: @user.email
		fill_in 'user[password]', with: @user.password
		click_button "Log in"
	  expect(page).to have_content "新しい曲"
	end

	# it "楽曲を投稿する" do
 #   visit root_path
	# 	click_link "Sign in"
	# 	fill_in 'user[email]', with: @user.email
	# 	fill_in 'user[password]', with: @user.password
	# 	click_button "Log in"

	#   click_link "New Song"
	# 	attach_file "song[file]", "#{Rails.root}/spec/files/My_Song_6.mp3"
	#   fill_in "song[title]", with: "testsong"
	# 	click_button "アップロード"
	# 	expect(page).to have_content "was successfully created"
	# end

end
