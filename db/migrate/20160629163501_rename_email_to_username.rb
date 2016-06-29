class RenameEmailToUsername < ActiveRecord::Migration
  def change
    # rename_column :users, :email, :username

    remove_column :users, :email
    add_column :users, :username, :string

  end
end
