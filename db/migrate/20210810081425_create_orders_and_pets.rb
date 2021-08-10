class CreateOrdersAndPets < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_and_pets, id: false do |t|
      t.belongs_to :order
      t.belongs_to :pet
    end
  end
end
