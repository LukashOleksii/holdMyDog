class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :status
      t.integer :cost
      t.text :description
      t.references :timeslot, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true
      t.references :sitter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
