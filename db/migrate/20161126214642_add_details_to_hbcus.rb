class AddDetailsToHbcus < ActiveRecord::Migration[5.0]
  def change
    add_column :hbcus, :city, :string
    add_column :hbcus, :state, :string
    add_column :hbcus, :zip_code, :string
    add_column :hbcus, :longitude, :decimal, precision: 10, scale: 6
    add_column :hbcus, :latitude, :decimal, precision: 10, scale: 6
    add_column :hbcus, :mission_statement, :text
  end
end
