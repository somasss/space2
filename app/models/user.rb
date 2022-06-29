class User < ApplicationRecord
  has_many :beats
  has_many :notes
  has_many :tasks
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
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
      user.password = "password"
      user.name = "ゲストユーザー"
    end
  end

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end



end
