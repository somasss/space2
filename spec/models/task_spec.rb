require 'rails_helper'

RSpec.describe 'タスクモデルのテスト', type: :model do
  it "タイトル、期限がある場合、有効である" do
    user = create(:user)
    task = Task.new(
      task_title: "test",
      due_date: " Wed, 29 Jun 2022 00:00:00 UTC +00:00",
      user_id: user.id,
    )
    expect(task).to be_valid
  end

  it "タイトルが空の場合、無効である" do
    user = create(:user)
    task = Task.new(
      task_title: "",
      due_date: "Wed, 29 Jun 2022 00:00:00 UTC +00:00",
      user_id: user.id,
    )
    expect(task.valid?).to eq(false)
  end

  it "期限が空の場合、無効である" do
    user = create(:user)
    task = Task.new(
      task_title: "test",
      due_date: "",
      user_id: user.id,
    )
    expect(task.valid?).to eq(false)
  end

  it "ユーザーIDが空の場合、無効である" do
    user = create(:user)
    task = Task.new(
      task_title: "test",
      due_date: "Wed, 29 Jun 2022 00:00:00 UTC +00:00",
      user_id: "",
    )
    expect(task.valid?).to eq(false)
  end

end