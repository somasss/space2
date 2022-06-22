class Note < ApplicationRecord
  belongs_to :user
  has_many :notelabels, dependent: :destroy
  has_many :labels, through: :notelabels
  validates :note_title, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
