require 'rails_helper'

RSpec.describe "Songs", type: :system do
  
  before do
    user = FactoryBot.create(:user)
	end

	it "新しい曲と表示される" do
	  visit root_path
	  click_link "Sign in"
	  
	  expect(page).to have_content "Log in"
	end

end
