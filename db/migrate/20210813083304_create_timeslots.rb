class CreateTimeslots < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslots do |t|
      t.datetime   :start_at
      t.datetime   :end_at

      t.references :availability, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
