class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, foreign_key: { to_table: :users }
      t.integer :following_id, foreign_key: { to_table: :users }
      t.index [:follower_id, :following_id], unique: true
      t.timestamps
    end
  end
end
