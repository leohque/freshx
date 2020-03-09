class AddGrowAndPlantToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :grow, foreign_key: true
    add_reference :posts, :plant, foreign_key: true
  end
end
