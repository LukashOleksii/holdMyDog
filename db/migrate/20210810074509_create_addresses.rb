class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string     :country
      t.string     :city
      t.string     :address_line1
      t.string     :address_line2
      t.string     :zipcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
