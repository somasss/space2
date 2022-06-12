class CreateNotelabels < ActiveRecord::Migration[6.0]
  def change
    create_table :notelabels do |t|
      t.references :note, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
