class CreateHbcus < ActiveRecord::Migration[5.0]
  def change
    create_table :hbcus do |t|
      t.string :name
      t.string :street_address

      t.timestamps
    end
  end
end
