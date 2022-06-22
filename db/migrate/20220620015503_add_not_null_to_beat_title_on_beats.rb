class AddNotNullToBeatTitleOnBeats < ActiveRecord::Migration[6.0]
  def change
    change_column_null :beats, :beat_title, false
  end
end
