class CreateApplicationsAndPets < ActiveRecord::Migration[6.1]
  def change
    create_table :applications_and_pets, id: false do |t|
      t.belongs_to :application
      t.belongs_to :pet
    end
  end
end
