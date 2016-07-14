class AddLattyToTacos < ActiveRecord::Migration
  def change

    add_column :tacos, :latitude, :string
    add_column :tacos, :longitude, :string
    add_column :tacos, :address_line_1, :string
    add_column :tacos, :city, :string
    add_column :tacos, :state, :string
    add_column :tacos, :zip, :string
    add_column :tacos, :country, :string

  end
end
