class RemoveOrderFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_reference :comments, :order, null: false, foreign_key: true
  end
end
