class Label < ApplicationRecord
  has_many :notelabels, dependent: :destroy
  has_many :notes, through: :notelabels
end
