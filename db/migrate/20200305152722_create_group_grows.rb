class CreateGroupGrows < ActiveRecord::Migration[5.2]
  def change
    create_table :group_grows do |t|
      t.references :grow, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
