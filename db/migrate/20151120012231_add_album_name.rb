class AddAlbumName < ActiveRecord::Migration
  def change
    drop_table :albums

    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
