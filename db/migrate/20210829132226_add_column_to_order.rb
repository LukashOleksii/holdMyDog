class AddColumnToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :capacity, :integer
  end
end
