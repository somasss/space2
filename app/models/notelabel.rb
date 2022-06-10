class Notelabel < ApplicationRecord
  belongs_to :note
  belongs_to :label
end
