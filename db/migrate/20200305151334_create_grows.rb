class CreateGrows < ActiveRecord::Migration[5.2]
  def change
    create_table :grows do |t|
      t.string :name
      t.text :description
      t.string :location
      t.boolean :indoors
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
