class AddTrackName < ActiveRecord::Migration
  def change
    drop_table :tracks

    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :song, null: false

      t.timestamps null: false
    end
  end
end
