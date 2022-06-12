class Label < ApplicationRecord
  has_many :notelabels, dependent: :destroy
  has_many :notes, through: :notelabels
  has_many :tasklabels, dependent: :destroy
  has_many :tasks, through: :tasklabels
end
