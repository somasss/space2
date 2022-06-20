class AddNotNullToNoteTitleAndTextOnNotes < ActiveRecord::Migration[6.0]
  def change
    change_column_null :notes, :note_title, false
    change_column_null :notes, :text, false
  end
end
