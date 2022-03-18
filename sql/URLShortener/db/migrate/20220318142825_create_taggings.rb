class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
			t.integer :tag_topic_id, null: false
      t.integer :shorten_url_id, null: false

      t.timestamps
    end
		add_index :taggings, %i(tag_topic_id shorten_url_id), unique: true
    add_index :taggings, :shorten_url_id
  end
end
