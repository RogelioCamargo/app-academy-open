class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false 
      t.string :password_digest, null: false 
      t.string :session_token, null: false 

      t.timestamps
    end

		add_index :users, :user_name, unique: true
		add_index :users, :password_digest, unique: true 
  end
end
