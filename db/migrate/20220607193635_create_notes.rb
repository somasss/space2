class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :note_title
      t.text :text
      t.string :youtube
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
