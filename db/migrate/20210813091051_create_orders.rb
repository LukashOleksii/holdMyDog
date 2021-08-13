class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string     :status
      t.integer    :cost
      t.text       :description
      
      t.references :availability, null: false, foreign_key: true
      t.references :timeslot,     null: false, foreign_key: true
      t.references :owner,        null: false, foreign_key: { to_table: :users }
      t.references :sitter,       null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
