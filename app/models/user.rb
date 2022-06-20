class User < ApplicationRecord
  has_many :beats
  has_many :notes
  has_many :tasks
  validates :email, presence: true
  validates :admin, presence: true
  validates :name, presence: true
  validates :sign_in_count, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
