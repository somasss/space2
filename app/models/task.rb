class Task < ApplicationRecord
  belongs_to :user
  enum status: {実行中: 0, 成功: 1, 失敗: 2}

  def start_time
    self.due_date
  end

end
