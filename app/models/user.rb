class User < ApplicationRecord
  has_many :beats
  has_many :notes
  has_many :tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
