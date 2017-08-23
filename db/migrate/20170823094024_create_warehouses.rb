class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :imei
      t.string :latitude
      t.string :longtitude
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
