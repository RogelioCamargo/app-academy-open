class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
			t.integer :album_id, null: false 
			t.string :name, null: false 
			t.integer :ord, null: false 
			t.text :lyrics
			t.boolean :bonus, null: false, default: false 
      t.timestamps
    end

		add_index :tracks, %i(album_id ord), unique: true 
  end
end
