class AddTimeInAndTimeOutToWarehouses < ActiveRecord::Migration
  def change
    add_column :warehouses, :time_in, :datetime
    add_column :warehouses, :time_out, :datetime
  end
end
