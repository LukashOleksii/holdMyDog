class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :region
      t.string :street
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
