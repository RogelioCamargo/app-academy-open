class CreateTagTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_topics do |t|
			t.string :name, null: false 

      t.timestamps
    end 
  end
end
