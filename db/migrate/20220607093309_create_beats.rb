class CreateBeats < ActiveRecord::Migration[6.0]
  def change
    create_table :beats do |t|
      t.string :beat_title
      t.string :sample_title
      t.string :sample_artist
      t.string :audio
      t.integer :beat_time
      t.text :memo

      t.timestamps
    end
  end
end
