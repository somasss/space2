class Category < ApplicationRecord
  has_many :beatcategory, dependent: :destroy
  has_many :beats, through: :beatcategory
end
