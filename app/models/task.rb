class Task < ApplicationRecord
  has_many :tasklabels, dependent: :destroy
  has_many :labels, through: :tasklabels
  belongs_to :user
  enum status: {実行中: 0, 成功: 1, 失敗: 2}
  validates :task_title, presence: true
  validates :due_date, presence: true
  validates :status, presence: true

  def start_time
    self.due_date
  end

end
