class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :follower, references: :users, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
