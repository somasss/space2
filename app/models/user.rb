class User < ApplicationRecord
  has_many :beats
  has_many :notes
  has_many :tasks
  validates :email, presence: true
  validates :name, presence: true
  validates :sign_in_count, presence: true
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  def self.admin_guest
    find_or_create_by!(email: 'adminguest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストadminユーザー"
      user.admin = true
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
end
