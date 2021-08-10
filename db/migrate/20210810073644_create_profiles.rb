class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :photo
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :description
      t.references :owner, null: false, foreign_key: true
      t.references :sitter, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
