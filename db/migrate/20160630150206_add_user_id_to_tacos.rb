class AddUserIdToTacos < ActiveRecord::Migration
  def change
    add_column :tacos, :user_id, :integer
  end
end
