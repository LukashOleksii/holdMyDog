class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :type
      t.string :name
      t.integer :weight
      t.integer :height
      t.string :gender
      t.decimal :years
      t.text :description
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
