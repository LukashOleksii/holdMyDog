class CreateTimeslots < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslots do |t|
      t.datetime   :start_at
      t.datetime   :end_at
      t.string     :status
      t.references :sitter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
