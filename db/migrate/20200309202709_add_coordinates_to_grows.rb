class AddCoordinatesToGrows < ActiveRecord::Migration[5.2]
  def change
    add_column :grows, :latitude, :float
    add_column :grows, :longitude, :float
  end
end
