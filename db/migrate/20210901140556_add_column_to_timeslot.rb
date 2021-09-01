class AddColumnToTimeslot < ActiveRecord::Migration[6.1]
  def change
    add_column :timeslots, :order_status, :boolean
  end
end
