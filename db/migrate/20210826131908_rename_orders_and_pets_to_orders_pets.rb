class RenameOrdersAndPetsToOrdersPets < ActiveRecord::Migration[6.1]
  def change
    rename_table :orders_and_pets, :orders_pets
  end
end
