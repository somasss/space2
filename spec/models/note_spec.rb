require 'rails_helper'

RSpec.describe 'ノートモデルのテスト', type: :model do
  it "タイトル、内容、UserIDがある場合、有効である" do
    user = create(:user)
    note = Note.new(
      note_title: "test",
      text: "test",
      user_id: user.id,
    )
    expect(note).to be_valid
  end

  it "タイトルが空の場合、無効である" do
    user = create(:user)
    note = Note.new(
      note_title: "",
      text: "test",
      user_id: user.id,
    )
    expect(note.valid?).to eq(false)
  end

  it "内容が空の場合、無効である" do
    user = create(:user)
    note = Note.new(
      note_title: "test",
      text: "",
      user_id: user.id,
    )
    expect(note.valid?).to eq(false)
  end

  it "ユーザーIDが空の場合、無効である" do
    user = create(:user)
    note = Note.new(
      note_title: "test",
      text: "test",
      user_id: "",
    )
    expect(note.valid?).to eq(false)
  end

end