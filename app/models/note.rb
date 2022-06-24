class Note < ApplicationRecord
  belongs_to :user
  has_many :notelabels, dependent: :destroy
  has_many :labels, through: :notelabels
  validates :note_title, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
end
