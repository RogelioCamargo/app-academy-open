class ChangeUsernameFromUsers < ActiveRecord::Migration[7.0]
  def change
		change_column :users, :username, :string, null: false
		add_index :users, :username, unique: true
  end
end
