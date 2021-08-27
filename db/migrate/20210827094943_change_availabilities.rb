class ChangeAvailabilities < ActiveRecord::Migration[6.1]
  def change
    add_column :availabilities, :capacity, :integer
    add_column :availabilities, :small_type, :boolean
    add_column :availabilities, :medium_type, :boolean
    add_column :availabilities, :large_type, :boolean
    add_column :availabilities, :giant_type, :boolean
    remove_column :availabilities, :weight
    remove_column :availabilities, :height
  end
end
