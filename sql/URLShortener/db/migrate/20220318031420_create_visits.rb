class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
			t.integer :visitor_id, null: false
			t.integer :shorten_url_id, null: false
			
      t.timestamps
    end
		add_index :visits, :visitor_id
		add_index :visits, :shorten_url_id
  end
end
