class Beat < ApplicationRecord
  belongs_to :user
  mount_uploader :audio, AudioUploader
  has_many :beatcategory, dependent: :destroy
  has_many :categories, through: :beatcategory, dependent: :destroy
  validates :beat_time, presence: true
  validates :beat_title, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
  validates :user_id, presence: true
end
