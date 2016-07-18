class AddPasswordResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_token_expiration, :datetime

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true

  end
end
