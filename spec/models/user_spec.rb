require 'rails_helper'

RSpec.describe 'ユーザーモデルのテスト', type: :model do
  it "名前、パスワード,Email,adminがある場合、有効である" do
    user = User.new(
      name: "test",
      email: Faker::Internet.email,
      password: "password",
      admin: true,
    )
    expect(user).to be_valid
  end

  it "名前が空の場合、無効である" do
    user = User.new(
      name: "",
      email: Faker::Internet.email,
      password: "password",
      admin: true,
    )
    expect(user.valid?).to eq(false)
  end

  it "Emailが空の場合、無効である" do
    user = User.new(
      name: "test",
      email: "",
      password: "password",
      admin: true,
    )
    expect(user.valid?).to eq(false) 
  end

  it "パスワードが空の場合、無効である" do
    user = User.new(
      name: "test",
      email: Faker::Internet.email,
      password: "",
      admin: true,
    )
    expect(user.valid?).to eq(false) 
  end

  it "adminが空場合、自動でfalseが入り有効になる" do
    user = User.new(
      name: "test",
      email: Faker::Internet.email,
      password: "password",
      admin: nil,
    )
    expect(user.valid?).to eq(true)
  end
end