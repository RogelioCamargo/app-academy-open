class AddPremiumToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :premium, :boolean
  end
end
