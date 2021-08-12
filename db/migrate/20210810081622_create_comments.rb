class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer    :raiting
      t.text       :body

      t.references :author,   null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.references :order,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
