class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string     :type
      t.string     :name
      t.string     :gender
      t.decimal    :years
      t.integer    :weight
      t.integer    :height
      t.text       :description
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
