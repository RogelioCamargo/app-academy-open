class ChangeFieldsInUsers < ActiveRecord::Migration[7.0]
  def change
		add_column :users, :username, :string
		remove_column :users, :name
		remove_column :users, :email
  end
end
