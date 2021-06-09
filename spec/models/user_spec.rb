require 'rails_helper'

RSpec.describe User, type: :model do

  it "name,email,passwordがあれば有効な状態であること" do
    user = User.new(
      name: "aaaaaa",
      email: "iiiiii@test.com",
      password: "uuuuuu"
    )
    expect(user).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "emailがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したemailなら無効な状態であること" do
    User.create(
      name: "aaaaaa",
      email: "iiiiii@test.com",
      password: "uuuuuu"
    )
    user = User.new(
      name: "eeeeee",
      email: "iiiiii@test.com",
      password: "oooooo"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

end
