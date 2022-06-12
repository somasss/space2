class Beat < ApplicationRecord
  belongs_to :user
  mount_uploader :audio, AudioUploader
  has_many :beatcategory, dependent: :destroy
  has_many :categories, through: :beatcategory
  validates :beat_time, presence: true
  validates :beat_title, presence: true
end
