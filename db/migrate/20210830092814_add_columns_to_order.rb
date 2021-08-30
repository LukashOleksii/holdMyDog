class AddColumnsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :small_type, :boolean, :default => false
    add_column :orders, :medium_type, :boolean, :default => false
    add_column :orders, :large_type, :boolean, :default => false
    add_column :orders, :giant_type, :boolean, :default => false
  end
end
