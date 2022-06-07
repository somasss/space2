class AddUserRefToBeats < ActiveRecord::Migration[6.0]
  def change
    add_reference :beats, :user, null: false, foreign_key: true
  end
end
