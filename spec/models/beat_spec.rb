require 'rails_helper'

RSpec.describe 'ビートモデルのテスト', type: :model do
  it "タイトル、時間がある場合、有効である" do
    user = create(:user)
    beat = Beat.new(
      beat_title: "test",
      beat_time: 20,
      user_id: user.id,
    )
    expect(beat).to be_valid
  end

  it "タイトルが空の場合、無効である" do
    user = create(:user)
    beat = Beat.new(
      beat_title: "",
      beat_time: 20,
      user_id: user.id,
    )
    expect(beat.valid?).to eq(false)
  end

  it "時間が空の場合、無効である" do
    user = create(:user)
    beat = Beat.new(
      beat_title: "",
      beat_time: "",
      user_id: user.id,
    )
    expect(beat.valid?).to eq(false)
  end

  it "ユーザーIDが空の場合、無効である" do
    user = create(:user)
    beat = Beat.new(
      beat_title: "test",
      beat_time: 20,
      user_id: "",
    )
    expect(beat.valid?).to eq(false)
  end

end