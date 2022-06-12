class CreateBeatcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :beatcategories do |t|
      t.references :beat, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
