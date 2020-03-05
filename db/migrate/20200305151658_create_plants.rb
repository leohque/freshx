class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :family
      t.string :genre
      t.string :species
      t.date :birthday
      t.date :harvestday
      t.references :grow, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
