class CreateShortenUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shorten_urls do |t|
			t.string :short_url, null: false
			t.string :long_url, null: false
			t.integer :submitter_id, null: false

      t.timestamps
    end
		add_index :shorten_urls, :short_url, unique: true
		add_index :shorten_urls, :submitter_id
  end
end
